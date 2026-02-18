import type { ISODateTime, UUID } from '../domain/types';

export interface PlanItemInput {
  canonicalItemId: UUID;
  quantity: number;
  unit: string;
}

export interface Plan {
  id: UUID;
  householdId: UUID;
  weekOf: ISODateTime;
  items: PlanItemInput[];
  createdAt: ISODateTime;
}

export interface ShopSession {
  id: UUID;
  householdId: UUID;
  storeId: UUID;
  startedAt: ISODateTime;
  endedAt?: ISODateTime;
}

export interface UseCases {
  createPlan(input: { householdId: UUID; weekOf: ISODateTime; items: PlanItemInput[] }): Promise<Plan>;
  startShopSession(input: { householdId: UUID; storeId: UUID; startedAt: ISODateTime }): Promise<ShopSession>;
  endShopSession(input: { sessionId: UUID; endedAt: ISODateTime }): Promise<void>;
}