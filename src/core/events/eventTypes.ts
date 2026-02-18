import type { ISODateTime, UUID } from '../domain/types';

export type EventName =
  | 'budget.set'
  | 'plan.created'
  | 'plan.item_added'
  | 'shop.session_started'
  | 'shop.store_selected'
  | 'shop.substitution_viewed'
  | 'shop.substitution_applied'
  | 'pantry.item_added'
  | 'pantry.item_updated'
  | 'savings.viewed';

export interface EventContext {
  screen?: string;
  storeId?: UUID;
  region?: string;
}

export interface BaseEvent {
  event_name: EventName;
  ts: ISODateTime;
  user_id: UUID;
  household_id: UUID;
  context?: EventContext;
  payload?: Record<string, unknown>;
}