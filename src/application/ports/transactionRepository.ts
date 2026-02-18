import type { Transaction } from "../../domain/transaction";

export interface TransactionRepository {
  /**
   * Returns transactions for a household within an optional date range.
   */
  listByHousehold(params: {
    householdId: string;
    startDate?: string; // ISO
    endDate?: string;   // ISO
  }): Promise<Transaction[]>;
}
