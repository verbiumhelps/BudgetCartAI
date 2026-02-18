import { supabaseClient } from '../../lib/supabase/client';

export async function createInvite(householdId: string, email: string, role: 'admin'|'member') {
  // token generation should be server-side (RPC/edge) in later phase
  const token = 'stub-token';
  const expires_at = new Date(Date.now() + 7*24*60*60*1000).toISOString();
  return supabaseClient().from('household_invites').insert({ household_id: householdId, email, role, token, expires_at }).select().single();
}

