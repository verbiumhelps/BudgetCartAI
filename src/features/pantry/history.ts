import { supabaseClient } from '../../lib/supabase/client';

export async function listPantryEvents(householdId: string, limit = 100) {
  return supabaseClient()
    .from('pantry_events')
    .select('*')
    .eq('household_id', householdId)
    .order('created_at', { ascending: false })
    .limit(limit);
}

