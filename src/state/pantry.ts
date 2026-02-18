import type { PantryEntry } from "../domain/entities";

export type PantryState = {
  entries: PantryEntry[];
};

export const defaultPantryState: PantryState = {
  entries: [],
};

export function sortUseSoon(entries: PantryEntry[]): PantryEntry[] {
  return [...entries].sort((a, b) => {
    const da = a.expiresOn ?? "9999-12-31";
    const db = b.expiresOn ?? "9999-12-31";
    return da.localeCompare(db);
  });
}

