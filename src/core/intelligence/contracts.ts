import type { ISODateTime, SavingsProjection, Store, UUID } from '../domain/types';

export type Confidence = 'low' | 'medium' | 'high';

export interface DataFreshness {
  capturedAt: ISODateTime;
  maxAgeDays: number;
}

export interface SubstitutionRecommendation {
  fromCanonicalItemId: UUID;
  toCanonicalItemId: UUID;
  storeId: UUID;
  estimatedDelta: number; // negative means cheaper
  similarityScore: number; // 0..1
  rationale: string;
  confidence: Confidence;
  freshness: DataFreshness;
}

export interface WasteRiskAlert {
  pantryItemId: UUID;
  canonicalItemId: UUID;
  risk: 'low' | 'medium' | 'high';
  rationale: string;
  expiresAt?: ISODateTime;
  computedAt: ISODateTime;
}

export interface BasketOptimizationInput {
  store: Store;
  householdId: UUID;
  canonicalItemIds: UUID[];
  budgetTarget?: number;
  preferences?: {
    brandAvoidList?: string[];
    dietaryTags?: string[];
    preferFewerSwaps?: boolean;
  };
}

export interface BasketOptimizationResult {
  substitutions: SubstitutionRecommendation[];
  savings: SavingsProjection;
  primaryOptimization: 'price' | 'waste' | 'time';
  computedAt: ISODateTime;
}

export interface IntelligenceEngine {
  recommendSubstitutions(input: BasketOptimizationInput): Promise<SubstitutionRecommendation[]>;
  optimizeBasket(input: BasketOptimizationInput): Promise<BasketOptimizationResult>;
  computeWasteRisk(input: { householdId: UUID; pantryItemIds: UUID[] }): Promise<WasteRiskAlert[]>;
}