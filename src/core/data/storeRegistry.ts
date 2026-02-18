import type { Store } from '../domain/types';

export type StoreSeed = Store;

/**
 * Deterministic seed list used until the real store data pipeline is implemented.
 * This module is intentionally static to keep early phases predictable.
 */
export const SOCAL_STORE_SEED: StoreSeed[] = [
  { id: 'store_ralphs_demo', region: 'socal', displayName: 'Ralphs (Demo)', chainKey: 'ralphs' },
  { id: 'store_vons_demo', region: 'socal', displayName: 'Vons (Demo)', chainKey: 'vons' },
  { id: 'store_traderjoes_demo', region: 'socal', displayName: "Trader Joe's (Demo)", chainKey: 'trader_joes' },
];