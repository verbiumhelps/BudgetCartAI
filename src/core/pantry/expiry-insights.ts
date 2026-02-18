import type { ISODate, PantryItem } from "./pantry-model";

/**
 * "days until" where:
 * - negative => already expired
 * - 0 => expires today
 * - positive => expires in N days
 *
 * Deterministic and timezone-free because it operates on ISODate YYYY-MM-DD only.
 */
export function daysUntil(date: ISODate, today: ISODate): number {
  // Parse as UTC midnight to avoid locale variance
  const d = new Date(date + "T00:00:00Z").getTime();
  const t = new Date(today + "T00:00:00Z").getTime();
  const ms = d - t;
  return Math.round(ms / (24 * 60 * 60 * 1000));
}

export type ExpirySeverity = "expired" | "urgent" | "soon" | "ok" | "unknown";

export interface ExpiryItemInsight {
  id: string;
  canonicalName: string;
  category?: string;
  expiresOn?: ISODate;
  daysUntilExpiry?: number;
  severity: ExpirySeverity;
}

export interface ExpiryInsightsSummary {
  today: ISODate;
  totalItems: number;
  withExpiryDate: number;
  expired: number;
  urgent: number; // 0-1 days
  soon: number;   // 2-3 days
  ok: number;     // 4+ days
}

export interface ExpiryInsightsResult {
  summary: ExpiryInsightsSummary;
  items: ExpiryItemInsight[]; // ordered by severity then days then name then id
}

export interface ExpiryThresholds {
  urgentDays: number; // <= urgentDays
  soonDays: number;   // <= soonDays (and > urgentDays)
}

const DEFAULT_THRESHOLDS: ExpiryThresholds = { urgentDays: 1, soonDays: 3 };

export function classifyExpiry(item: PantryItem, today: ISODate, thresholds?: ExpiryThresholds): ExpiryItemInsight {
  const th = thresholds ?? DEFAULT_THRESHOLDS;

  const base: ExpiryItemInsight = {
    id: item.id,
    canonicalName: item.canonicalName,
    severity: "unknown"
  };

  const withOptional = {
    ...base,
    ...(item.category ? { category: item.category } : {}),
    ...(item.expiresOn ? { expiresOn: item.expiresOn } : {}),
  };

  if (!item.expiresOn) {
    return withOptional;
  }

  const d = daysUntil(item.expiresOn, today);

  const severity: ExpirySeverity =
    d < 0
      ? "expired"
      : d <= th.urgentDays
        ? "urgent"
        : d <= th.soonDays
          ? "soon"
          : "ok";

  return {
    ...withOptional,
    daysUntilExpiry: d,
    severity
  };
}
function severityRank(s: ExpirySeverity): number {
  switch (s) {
    case "expired": return 0;
    case "urgent":  return 1;
    case "soon":    return 2;
    case "ok":      return 3;
    case "unknown": return 4;
  }
}

export function buildExpiryInsights(
  items: PantryItem[],
  today: ISODate,
  thresholds?: ExpiryThresholds
): ExpiryInsightsResult {
  const insights = items.map((x) => classifyExpiry(x, today, thresholds));

  let withExpiryDate = 0;
  let expired = 0;
  let urgent = 0;
  let soon = 0;
  let ok = 0;

  for (const i of insights) {
    if (i.expiresOn) withExpiryDate += 1;
    if (i.severity === "expired") expired += 1;
    else if (i.severity === "urgent") urgent += 1;
    else if (i.severity === "soon") soon += 1;
    else if (i.severity === "ok") ok += 1;
  }

  // Deterministic ordering
  insights.sort((a, b) => {
    const ar = severityRank(a.severity);
    const br = severityRank(b.severity);
    if (ar !== br) return ar - br;

    // daysUntilExpiry: undefined should sort last within same severity
    const ad = a.daysUntilExpiry;
    const bd = b.daysUntilExpiry;
    const aHas = typeof ad === "number";
    const bHas = typeof bd === "number";
    if (aHas && bHas && ad !== bd) return ad - bd;
    if (aHas && !bHas) return -1;
    if (!aHas && bHas) return 1;

    const an = a.canonicalName.toLowerCase();
    const bn = b.canonicalName.toLowerCase();
    if (an < bn) return -1;
    if (an > bn) return 1;

    return a.id < b.id ? -1 : a.id > b.id ? 1 : 0;
  });

  return {
    summary: {
      today,
      totalItems: items.length,
      withExpiryDate,
      expired,
      urgent,
      soon,
      ok
    },
    items: insights
  };
}