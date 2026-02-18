import type { Transaction } from "../domain/transaction";
import { createListHouseholdTransactionsUseCase } from "../composition";

export async function listHouseholdTransactions(params: {
  householdId: string;
  startDate?: string;
  endDate?: string;
}): Promise<Transaction[]> {
  const useCase = createListHouseholdTransactionsUseCase();
  const result = await useCase.execute(params);
  return result.transactions;
}
