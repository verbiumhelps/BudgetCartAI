import type { ISODate, PantryQuery } from "./pantry-model";
import type { PantryRepo } from "./pantry-repo";
import type { ExpiryInsightsResult, ExpiryThresholds } from "./expiry-insights";
import { buildExpiryInsights } from "./expiry-insights";

/**
 * Repository-backed expiry insights.
 * Keeps orchestration clean: repo access stays here; pure insight logic stays in expiry-insights.ts.
 */
export async function getExpiryInsights(
  repo: PantryRepo,
  today: ISODate,
  query?: PantryQuery,
  thresholds?: ExpiryThresholds
): Promise<ExpiryInsightsResult> {
  const items = await repo.list(query);
  return buildExpiryInsights(items, today, thresholds);
}