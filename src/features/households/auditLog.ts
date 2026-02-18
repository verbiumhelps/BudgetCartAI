import { supabaseClient } from '../../lib/supabase/client';

export async function listAuditLog(householdId: string, limit = 50) {
  return supabaseClient()
    .from('audit_log')
    .select('*')
    .eq('household_id', householdId)
    .order('created_at', { ascending: false })
    .limit(limit);
}

