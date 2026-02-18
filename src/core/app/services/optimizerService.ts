import type { Repos } from '../../data/repositories';
import type { IntelligenceEngine, BasketOptimizationInput, BasketOptimizationResult } from '../../intelligence/contracts';

/**
 * App-layer orchestration skeleton.
 * No data fetching yet; this is a typed boundary for later implementation.
 */
export class OptimizerService {
  private repos: Repos;
  private engine: IntelligenceEngine;

  constructor(input: { repos: Repos; engine: IntelligenceEngine }) {
    this.repos = input.repos;
    this.engine = input.engine;
  }

  async optimize(input: BasketOptimizationInput): Promise<BasketOptimizationResult> {
    // Later phases will pull baseline cost and quotes from repos.
    return this.engine.optimizeBasket(input);
  }
}