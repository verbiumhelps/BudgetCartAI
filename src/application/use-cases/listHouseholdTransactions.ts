import type { Transaction } from "../../domain/transaction";
import type { TransactionRepository } from "../ports/transactionRepository";

export interface ListHouseholdTransactionsInput {
  householdId: string;
  startDate?: string; // ISO string
  endDate?: string;   // ISO string
}

export interface ListHouseholdTransactionsOutput {
  transactions: Transaction[];
}

export class ListHouseholdTransactions {
  constructor(private readonly repository: TransactionRepository) {}

  async execute(
    input: ListHouseholdTransactionsInput
  ): Promise<ListHouseholdTransactionsOutput> {
    if (!input.householdId || input.householdId.trim().length === 0) {
      throw new Error("householdId is required");
    }

    const transactions = await this.repository.listByHousehold({
      householdId: input.householdId,
      startDate: input.startDate,
      endDate: input.endDate,
    });

    return { transactions };
  }
}
