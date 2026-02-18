import { supabaseClient } from '../../lib/supabase/client';

export async function listFavorites(householdId: string, userId: string) {
  return supabaseClient().from('favorites').select('*').eq('household_id', householdId).eq('user_id', userId);
}

export async function addFavorite(householdId: string, userId: string, label: string, canonical_item_id?: string) {
  return supabaseClient().from('favorites').insert({ household_id: householdId, user_id: userId, label, canonical_item_id }).select().single();
}

export async function removeFavorite(householdId: string, userId: string, label: string) {
  return supabaseClient().from('favorites').delete().eq('household_id', householdId).eq('user_id', userId).eq('label', label);
}

