export type PlanTier = "free" | "pro";

export const PRO_ENTITLEMENTS = {
  projectedSavingsModeling: true,
  substitutionsUnlimited: true,
  multiStoreOptimization: true,
  discountAlerts: true,
  pantryAutomation: true,
  wasteForecasting: true,
  recipesUnlimited: true,
  priceVolatilityInsights: true,
} as const;

export const FREE_LIMITS = {
  recipeSuggestionsPerWeek: 3,
  storeComparisonsPerWeek: 3,
} as const;

export function canUseProFeature(tier: PlanTier): boolean {
  return tier === "pro";
}

