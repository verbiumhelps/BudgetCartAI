import { supabaseClient } from '../../lib/supabase/client';

export async function listMyHouseholds(userId: string) {
  // requires household_members RLS + join view later
  return supabaseClient().from('household_members').select('household_id, role').eq('user_id', userId);
}

