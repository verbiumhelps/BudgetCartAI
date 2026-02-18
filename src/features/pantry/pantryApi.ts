import { supabaseClient } from '../../lib/supabase/client';

export type PantryItemInput = {
  household_id: string;
  label: string;
  canonical_item_id?: string;
  quantity?: number;
  unit?: string;
  purchased_at?: string; // YYYY-MM-DD
  expires_at?: string;   // YYYY-MM-DD
};

export async function addPantryItem(input: PantryItemInput) {
  return supabaseClient().from('pantry_items').insert(input).select().single();
}

export async function updatePantryItem(id: string, patch: Partial<PantryItemInput>) {
  return supabaseClient().from('pantry_items').update(patch).eq('id', id).select().single();
}

