import { supabaseClient } from '../../lib/supabase/client';

export async function consumePantryItem(itemId: string, amount: number) {
  // NOTE: real implementation should be transactional (RPC) later.
  const current = await supabaseClient().from('pantry_items').select('quantity').eq('id', itemId).single();
  if (current.error) return current;
  const q = (current.data as any).quantity ?? 0;
  const next = Math.max(0, Number(q) - Number(amount));
  return supabaseClient().from('pantry_items').update({ quantity: next }).eq('id', itemId).select().single();
}

