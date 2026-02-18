/**
 * Composition Root
 * Centralizes dependency wiring.
 * UI layer imports from here instead of constructing infrastructure directly.
 */

import { SupabaseTransactionRepository } from "../infrastructure/repositories/supabaseTransactionRepository";
import { ListHouseholdTransactions } from "../application/use-cases/listHouseholdTransactions";

export function createListHouseholdTransactionsUseCase() {
  const repository = new SupabaseTransactionRepository();
  return new ListHouseholdTransactions(repository);
}
