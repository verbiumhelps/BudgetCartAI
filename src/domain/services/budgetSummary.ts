import type { BudgetPeriod } from "../budget";
import type { Transaction } from "../transaction";

export interface BudgetSummary {
  plannedCents: number;
  spentCents: number;
  remainingCents: number;
  utilizationRatio: number;
  isOverBudget: boolean;
}

export function buildBudgetSummary(params: {
  budget: BudgetPeriod;
  transactions: Transaction[];
}): BudgetSummary {
  const { budget, transactions } = params;

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
    utilizationRatio,
    isOverBudget: remainingCents < 0,
  };
}
