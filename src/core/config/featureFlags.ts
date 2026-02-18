export interface FeatureFlags {
  enableMultiStoreOptimization: boolean;
  enableDiscountAlerts: boolean;
  enablePantryAutomation: boolean;
  enableWasteForecasting: boolean;
}

export const DEFAULT_FLAGS: FeatureFlags = {
  enableMultiStoreOptimization: false,
  enableDiscountAlerts: false,
  enablePantryAutomation: false,
  enableWasteForecasting: false,
};