import { money, type Money } from "../domain/types";

export type WeeklyBudgetState = {
  weeklyBudget: Money;
  spentSoFar: Money;
};

export const defaultWeeklyBudgetState: WeeklyBudgetState = {
  weeklyBudget: money(15000), // $150.00 default
  spentSoFar: money(0),
};

export function projectedSavings(weeklyBudget: Money, spentSoFar: Money): Money {
  // Deterministic: savings is remaining budget if positive, else $0
  const remaining = weeklyBudget.cents - spentSoFar.cents;
  return money(Math.max(0, remaining));
}

