export type ISODate = string;

export interface PantryItem {
  id: string;                 // stable uuid
  canonicalName: string;      // normalized display name
  quantity: number;           // numeric quantity in unit
  unit: "each" | "oz" | "lb" | "g" | "kg" | "ml" | "l";
  category?: string;          // e.g. dairy, produce, pantry
  expiresOn?: ISODate;        // optional expiry date (YYYY-MM-DD)
  createdAt: ISODate;         // audit-friendly
  updatedAt: ISODate;         // audit-friendly
}

export interface PantryUpsertInput {
  id: string;
  canonicalName: string;
  quantity: number;
  unit: PantryItem["unit"];
  category?: string;
  expiresOn?: ISODate;
}

export interface PantryQuery {
  includeExpired?: boolean;
  expiresBefore?: ISODate;
  category?: string;
  search?: string;
}

export function normalizeName(name: string): string {
  return name.trim().replace(/\s+/g, " ");
}

export function isExpired(item: PantryItem, today: ISODate): boolean {
  if (!item.expiresOn) return false;
  return item.expiresOn < today;
}