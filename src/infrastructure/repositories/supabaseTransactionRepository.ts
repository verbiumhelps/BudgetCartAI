import type { Transaction } from "../../domain/transaction";
import type { TransactionRepository } from "../../application/ports/transactionRepository";
import { getSupabaseClient } from "../supabase/client";

type TransactionRow = {
  id: string;
  household_id: string;
  store_id: string;
  total_cents: number;
  occurred_at: string;
};

function mapRow(r: TransactionRow): Transaction {
  return {
    id: r.id,
    householdId: r.household_id,
    storeId: r.store_id,
    totalCents: r.total_cents,
    occurredAt: r.occurred_at,
  };
}

/**
 * Supabase implementation of TransactionRepository.
 * NOTE: Table/column names are placeholders until schema phase locks them.
 */
export class SupabaseTransactionRepository implements TransactionRepository {
  async listByHousehold(params: {
    householdId: string;
    startDate?: string;
    endDate?: string;
  }): Promise<Transaction[]> {
    const supabase = getSupabaseClient();

    let query = supabase
      .from("transactions")
      .select("id, household_id, store_id, total_cents, occurred_at")
      .eq("household_id", params.householdId);

    if (params.startDate) query = query.gte("occurred_at", params.startDate);
    if (params.endDate) query = query.lte("occurred_at", params.endDate);

    const { data, error } = await query;
    if (error) throw error;

    return (data ?? []).map(mapRow);
  }
}
