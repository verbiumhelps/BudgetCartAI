export interface BudgetPeriod {
  id: string;
  householdId: string;
  startDate: string;
  endDate: string;
  plannedAmountCents: number;
  createdAt: string;
}
