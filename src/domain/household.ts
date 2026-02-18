export interface Household {
  id: string;
  name: string;
  createdAt: string;
}

export interface HouseholdMember {
  householdId: string;
  userId: string;
  joinedAt: string;
}
