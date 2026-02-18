export type ISODateTime = string;
export type UUID = string;

export type RegionKey = 'socal';

export type StoreChainKey =
  | 'ralphs'
  | 'vons'
  | 'albertsons'
  | 'trader_joes'
  | 'costco'
  | 'walmart'
  | 'target'
  | 'unknown';

export interface Household {
  id: UUID;
  name: string;
  createdAt: ISODateTime;
}

export interface HouseholdMember {
  householdId: UUID;
  userId: UUID;
  role: 'owner' | 'member';
  createdAt: ISODateTime;
}

export interface CanonicalItem {
  id: UUID;
  name: string;
  category: string;
  attributes?: Record<string, string>;
}

export interface PantryItem {
  id: UUID;
  householdId: UUID;
  canonicalItemId: UUID;
  quantity: number;
  unit: string;
  expiresAt?: ISODateTime;
  source: 'scan' | 'manual';
  updatedAt: ISODateTime;
}

export interface Store {
  id: UUID;
  region: RegionKey;
  displayName: string;
  chainKey: StoreChainKey;
}

export interface PriceQuote {
  canonicalItemId: UUID;
  storeId: UUID;
  price: number;
  unit: string;
  unitPrice?: number;
  capturedAt: ISODateTime;
  source: 'user' | 'scrape' | 'partner' | 'unknown';
}

export interface BasketLineItem {
  canonicalItemId: UUID;
  quantity: number;
  unit: string;
}

export interface Basket {
  householdId: UUID;
  storeId: UUID;
  items: BasketLineItem[];
  createdAt: ISODateTime;
}

export interface SavingsAssumption {
  key: string;
  value: string;
}

export interface SavingsProjection {
  baselineCost: number;
  optimizedCost: number;
  delta: number;
  assumptions: SavingsAssumption[];
  computedAt: ISODateTime;
}