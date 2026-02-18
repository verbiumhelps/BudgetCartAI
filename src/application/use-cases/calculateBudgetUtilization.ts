import { BudgetPeriod } from "../../domain/budget";
import { Transaction } from "../../domain/transaction";

export interface BudgetUtilizationResult {
  plannedCents: number;
  spentCents: number;
  remainingCents: number;
  utilizationRatio: number;
}

export function calculateBudgetUtilization(
  budget: BudgetPeriod,
  transactions: Transaction[]
): BudgetUtilizationResult {
  const spentCents = transactions
    .filter(t => t.householdId === budget.householdId)
    .reduce((sum, t) => sum + t.totalCents, 0);

  const plannedCents = budget.plannedAmountCents;
  const remainingCents = plannedCents - spentCents;
  const utilizationRatio =
    plannedCents === 0 ? 0 : spentCents / plannedCents;

  return {
    plannedCents,
    spentCents,
    remainingCents,
    utilizationRatio
  };
}
