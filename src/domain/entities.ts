import type { HouseholdId, ItemId, ISODate, Money, StoreId, UUID } from "./types";

export type CanonicalItem = {
  id: ItemId;
  canonicalName: string;
  category: string;
  defaultUnit: "each" | "oz" | "lb" | "g" | "ml";
};

export type PantryEntry = {
  id: UUID;
  householdId: HouseholdId;
  itemId: ItemId;
  quantity: number;
  unit: CanonicalItem["defaultUnit"];
  expiresOn?: ISODate;
  updatedAt: string; // ISO datetime
};

export type ShoppingList = {
  id: UUID;
  householdId: HouseholdId;
  weekOf: ISODate; // week start
  createdAt: string;
};

export type ShoppingListItem = {
  id: UUID;
  listId: UUID;
  itemId: ItemId;
  quantity: number;
  unit: CanonicalItem["defaultUnit"];
  targetMaxPrice?: Money;
  checked: boolean;
};

export type StorePrice = {
  id: UUID;
  storeId: StoreId;
  itemId: ItemId;
  price: Money;
  capturedAt: string; // ISO datetime
};

export type Recommendation = {
  id: UUID;
  householdId: HouseholdId;
  kind: "substitute" | "use_soon" | "buy_now" | "skip";
  title: string;
  detail: string;
  impact?: Money; // estimated weekly savings delta
  createdAt: string;
};

