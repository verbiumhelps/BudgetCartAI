import { supabaseClient } from '../../lib/supabase/client';

export async function createList(householdId: string, name: string) {
  return supabaseClient().from('grocery_lists').insert({ household_id: householdId, name }).select().single();
}

export async function renameList(listId: string, name: string) {
  return supabaseClient().from('grocery_lists').update({ name }).eq('id', listId).select().single();
}

export async function deleteList(listId: string) {
  return supabaseClient().from('grocery_lists').delete().eq('id', listId);
}

