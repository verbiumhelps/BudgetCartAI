import type { ISODate, PantryItem, PantryQuery, PantryUpsertInput } from "./pantry-model";
import { isExpired, normalizeName } from "./pantry-model";

export interface PantryRepo {
  list(query?: PantryQuery): Promise<PantryItem[]>;
  get(id: string): Promise<PantryItem | null>;
  upsert(input: PantryUpsertInput, now: ISODate): Promise<PantryItem>;
  remove(id: string): Promise<boolean>;
}

export class InMemoryPantryRepo implements PantryRepo {
  private readonly byId = new Map<string, PantryItem>();

  async list(query?: PantryQuery): Promise<PantryItem[]> {
    const q = query ?? {};
    const today = q.expiresBefore ?? "9999-12-31";

    let items = Array.from(this.byId.values());

    if (q.category) {
      items = items.filter((x) => x.category === q.category);
    }

    if (q.search) {
      const s = normalizeName(q.search).toLowerCase();
      items = items.filter((x) => x.canonicalName.toLowerCase().includes(s));
    }

    if (!q.includeExpired) {
      // Use expiresBefore if provided, else allow all (non-expiring are always included)
      const cutoff = q.expiresBefore ?? today;
      items = items.filter((x) => !isExpired(x, cutoff));
    } else if (q.expiresBefore) {
      // If includeExpired but expiresBefore is set, constrain to items expiring before cutoff
      items = items.filter((x) => x.expiresOn ? x.expiresOn < q.expiresBefore! : false);
    }

    // Deterministic ordering: soonest expiry first, then name, then id
    items.sort((a, b) => {
      const ae = a.expiresOn ?? "9999-12-31";
      const be = b.expiresOn ?? "9999-12-31";
      if (ae < be) return -1;
      if (ae > be) return 1;
      const an = a.canonicalName.toLowerCase();
      const bn = b.canonicalName.toLowerCase();
      if (an < bn) return -1;
      if (an > bn) return 1;
      return a.id < b.id ? -1 : a.id > b.id ? 1 : 0;
    });

    return items;
  }

  async get(id: string): Promise<PantryItem | null> {
    return this.byId.get(id) ?? null;
  }

  async upsert(input: PantryUpsertInput, now: ISODate): Promise<PantryItem> {
    const existing = this.byId.get(input.id);

    const base: PantryItem = {
      id: input.id,
      canonicalName: normalizeName(input.canonicalName),
      quantity: input.quantity,
      unit: input.unit,
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    };

    const next: PantryItem = {
      ...base,
      ...(input.category ? { category: input.category } : {}),
      ...(input.expiresOn ? { expiresOn: input.expiresOn } : {}),
    };
    this.byId.set(input.id, next);
    return next;
  }

  async remove(id: string): Promise<boolean> {
    return this.byId.delete(id);
  }
}