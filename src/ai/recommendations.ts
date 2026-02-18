import type { PantryEntry, Recommendation, StorePrice } from "../domain/entities";
import { money, type Money } from "../domain/types";

export type SubstituteCandidate = {
  title: string;
  detail: string;
  delta: Money; // positive cents = save
};

export function recommendUseSoon(householdId: string, pantry: PantryEntry[], nowIso: string): Recommendation[] {
  // Deterministic: mark items expiring within 3 days
  const now = new Date(nowIso);
  const cutoff = new Date(now.getTime() + 3 * 24 * 60 * 60 * 1000);

  return pantry
    .filter(p => !!p.expiresOn)
    .filter(p => new Date(p.expiresOn as string) <= cutoff)
    .map(p => ({
      id: "rec_use_soon_" + p.id,
      householdId,
      kind: "use_soon",
      title: "Use soon",
      detail: "An item in your pantry is nearing expiry. Consider planning a meal that uses it.",
      impact: money(0),
      createdAt: nowIso,
    }));
}

export function bestPriceDelta(current: StorePrice, alternative: StorePrice): Money {
  // Deterministic: delta = current - alternative (if positive, alternative saves)
  return money(Math.max(0, current.price.cents - alternative.price.cents));
}

export function recommendSubstitute(title: string, detail: string, deltaCents: number): SubstituteCandidate {
  return { title, detail, delta: money(Math.max(0, Math.trunc(deltaCents))) };
}

