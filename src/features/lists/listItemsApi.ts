import { supabaseClient } from '../../lib/supabase/client';

export async function addItem(listId: string, label: string, qty?: number, unit?: string, note?: string) {
  return supabaseClient().from('grocery_list_items').insert({ list_id: listId, label, qty, unit, note }).select().single();
}

export async function setChecked(itemId: string, is_checked: boolean) {
  return supabaseClient().from('grocery_list_items').update({ is_checked }).eq('id', itemId).select().single();
}

export async function updateItem(itemId: string, patch: { label?: string; qty?: number; unit?: string; note?: string }) {
  return supabaseClient().from('grocery_list_items').update(patch).eq('id', itemId).select().single();
}

export async function removeItem(itemId: string) {
  return supabaseClient().from('grocery_list_items').delete().eq('id', itemId);
}

