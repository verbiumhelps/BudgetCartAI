import { supabaseClient } from '../../lib/supabase/client';

export async function getLatestPricesForStoreItems(storeItemIds: string[]) {
  if (storeItemIds.length === 0) return { data: [], error: null } as any;
  return supabaseClient()
    .from('latest_price')
    .select('*')
    .in('store_item_id', storeItemIds);
}

