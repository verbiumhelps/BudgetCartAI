import { supabaseClient } from '../../lib/supabase/client';

export async function createHousehold(name: string, region?: string) {
  return supabaseClient().from('households').insert({ name, region }).select().single();
}

