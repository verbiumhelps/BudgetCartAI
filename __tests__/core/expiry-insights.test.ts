import { describe, it, expect } from "vitest";
import { buildExpiryInsights, daysUntil } from "../../src/core/pantry/expiry-insights";
import type { PantryItem } from "../../src/core/pantry/pantry-model";

describe("expiry-insights", () => {
  it("computes daysUntil deterministically", () => {
    expect(daysUntil("2026-02-17", "2026-02-17")).toBe(0);
    expect(daysUntil("2026-02-18", "2026-02-17")).toBe(1);
    expect(daysUntil("2026-02-16", "2026-02-17")).toBe(-1);
  });

  it("classifies and summarizes items with deterministic ordering", () => {
    const today = "2026-02-17";
    const items: PantryItem[] = [
      { id: "c", canonicalName: "Rice", quantity: 1, unit: "lb", createdAt: today, updatedAt: today },
      { id: "a", canonicalName: "Milk 2%", quantity: 1, unit: "each", expiresOn: "2026-02-17", createdAt: today, updatedAt: today },
      { id: "b", canonicalName: "Yogurt", quantity: 1, unit: "each", expiresOn: "2026-02-16", createdAt: today, updatedAt: today },
      { id: "d", canonicalName: "Spinach", quantity: 1, unit: "each", expiresOn: "2026-02-19", createdAt: today, updatedAt: today }
    ];

    const result = buildExpiryInsights(items, today);

    expect(result.summary.totalItems).toBe(4);
    expect(result.summary.withExpiryDate).toBe(3);
    expect(result.summary.expired).toBe(1);
    expect(result.summary.urgent).toBe(1);
    expect(result.summary.soon).toBe(1);
    expect(result.summary.ok).toBe(0);

    // Ordering: expired first, then urgent (0-1 days), then soon, then ok, then unknown
    expect(result.items.map((x) => x.id)).toEqual(["b", "a", "d", "c"]);
    expect(result.items.length).toBe(4);
    expect(result.items[0]!.severity).toBe("expired");
    expect(result.items[1]!.severity).toBe("urgent");
    expect(result.items[2]!.severity).toBe("soon");
    expect(result.items[3]!.severity).toBe("unknown");
  });
});