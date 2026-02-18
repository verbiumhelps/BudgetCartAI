export interface PantryItem {
  id: string;
  householdId: string;
  name: string;
  quantity: number;
  unit: string;
  expiresAt?: string;
  createdAt: string;
}
