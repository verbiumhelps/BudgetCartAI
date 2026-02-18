import { supabaseClient } from '../../lib/supabase/client';

export type RecommendationQuery = {
  store_id: string;
  canonical_item_id: string;
};

export async function getCheaperSimilarAtStore(q: RecommendationQuery) {
  // Placeholder: implement via RPC (recommended) once pricing + rules stabilize.
  // Expected RPC: recommend_cheaper_similar(store_id, canonical_item_id)
  return supabaseClient().rpc('recommend_cheaper_similar', q as any);
}

