import { supabaseClient } from '../../lib/supabase/client';

export async function acceptInvite(token: string, userId: string) {
  // In later phase: validate token, expiry, household permissions via RPC
  const inv = await supabaseClient().from('household_invites').select('*').eq('token', token).single();
  if (inv.error) return inv;
  const household_id = (inv.data as any).household_id;
  const role = ((inv.data as any).role ?? 'member');
  return supabaseClient().from('household_members').insert({ household_id, user_id: userId, role }).select().single();
}

