import type { IntelligenceEngine, BasketOptimizationInput, BasketOptimizationResult, SubstitutionRecommendation, WasteRiskAlert } from './contracts';
import type { ISODateTime } from '../domain/types';

function nowIso(): ISODateTime {
  return new Date().toISOString();
}

/**
 * Deterministic stub engine.
 * Returns safe defaults while preserving typed boundaries.
 */
export const StubIntelligenceEngine: IntelligenceEngine = {
  async recommendSubstitutions(_input: BasketOptimizationInput): Promise<SubstitutionRecommendation[]> {
    
    void _input;
return [];
  },

  async optimizeBasket(_input: BasketOptimizationInput): Promise<BasketOptimizationResult> {
    
    void _input;
return {
      substitutions: [],
      savings: {
        baselineCost: 0,
        optimizedCost: 0,
        delta: 0,
        assumptions: [],
        computedAt: nowIso(),
      },
      primaryOptimization: 'price',
      computedAt: nowIso(),
    };
  },

  async computeWasteRisk(_input: { householdId: string; pantryItemIds: string[] }): Promise<WasteRiskAlert[]> {
    
    void _input;
return [];
  },
};