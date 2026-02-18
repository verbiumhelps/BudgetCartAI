import { supabaseClient } from '../../lib/supabase/client';

export type ReceiptInput = { household_id: string; store_id?: string; purchased_at: string; total: number };

export async function addReceipt(input: ReceiptInput) {
  return supabaseClient().from('receipts').insert(input).select().single();
}

export async function listReceipts(householdId: string, limit = 50) {
  return supabaseClient().from('receipts').select('*').eq('household_id', householdId).order('purchased_at', { ascending: false }).limit(limit);
}

