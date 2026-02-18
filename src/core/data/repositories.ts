import type {
  Basket,
  CanonicalItem,
  Household,
  HouseholdMember,
  ISODateTime,
  PantryItem,
  PriceQuote,
  Store,
  UUID,
} from '../domain/types';

export interface ListOptions {
  limit?: number;
  cursor?: string;
}

export interface ResultPage<T> {
  items: T[];
  nextCursor?: string;
}

export interface HouseholdRepo {
  getHousehold(householdId: UUID): Promise<Household | null>;
  listHouseholdsForUser(userId: UUID, opts?: ListOptions): Promise<ResultPage<Household>>;
  createHousehold(input: { name: string; createdAt: ISODateTime }): Promise<Household>;
}

export interface HouseholdMemberRepo {
  listMembers(householdId: UUID, opts?: ListOptions): Promise<ResultPage<HouseholdMember>>;
  addMember(input: { householdId: UUID; userId: UUID; role: 'owner' | 'member'; createdAt: ISODateTime }): Promise<HouseholdMember>;
  removeMember(input: { householdId: UUID; userId: UUID }): Promise<void>;
}

export interface PantryRepo {
  listPantry(householdId: UUID, opts?: ListOptions): Promise<ResultPage<PantryItem>>;
  upsertPantryItem(input: Omit<PantryItem, 'id'> & { id?: UUID }): Promise<PantryItem>;
  deletePantryItem(pantryItemId: UUID): Promise<void>;
}

export interface CatalogRepo {
  getCanonicalItem(canonicalItemId: UUID): Promise<CanonicalItem | null>;
  searchCanonicalItems(query: string, opts?: ListOptions): Promise<ResultPage<CanonicalItem>>;
}

export interface StoreRepo {
  listStores(region?: string, opts?: ListOptions): Promise<ResultPage<Store>>;
  getStore(storeId: UUID): Promise<Store | null>;
}

export interface PricingRepo {
  listQuotes(input: { storeId: UUID; canonicalItemIds: UUID[]; newerThan?: ISODateTime }): Promise<PriceQuote[]>;
  upsertQuote(input: PriceQuote): Promise<PriceQuote>;
}

export interface BasketRepo {
  createBasket(input: Basket): Promise<Basket>;
  getLatestBasket(householdId: UUID, storeId: UUID): Promise<Basket | null>;
}

export interface Repos {
  household: HouseholdRepo;
  householdMembers: HouseholdMemberRepo;
  pantry: PantryRepo;
  catalog: CatalogRepo;
  store: StoreRepo;
  pricing: PricingRepo;
  basket: BasketRepo;
}