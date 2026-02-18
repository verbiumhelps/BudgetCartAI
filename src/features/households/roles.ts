export type HouseholdRole = 'owner' | 'admin' | 'member';

export function canManageMembers(role: HouseholdRole): boolean {
  return role === 'owner' || role === 'admin';
}

export function canEditHousehold(role: HouseholdRole): boolean {
  return role === 'owner' || role === 'admin';
}

