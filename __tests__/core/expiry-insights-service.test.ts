import { describe, it, expect } from "vitest";
import { InMemoryPantryRepo } from "../../src/core/pantry/pantry-repo";
import { getExpiryInsights } from "../../src/core/pantry/expiry-insights-service";

describe("expiry-insights-service", () => {
  it("returns insights from repo-backed items", async () => {
    const repo = new InMemoryPantryRepo();
    const today = "2026-02-17";

    await repo.upsert({ id: "a", canonicalName: "Milk 2%", quantity: 1, unit: "each", expiresOn: "2026-02-17" }, today);
    await repo.upsert({ id: "b", canonicalName: "Yogurt", quantity: 1, unit: "each", expiresOn: "2026-02-16" }, today);
    await repo.upsert({ id: "c", canonicalName: "Rice", quantity: 1, unit: "lb" }, today);

    const result = await getExpiryInsights(repo, today);

    expect(result.summary.totalItems).toBe(3);
    expect(result.items.map((x) => x.id)).toEqual(["b", "a", "c"]);
    expect(result.items[0]!.severity).toBe("expired");
    expect(result.items[1]!.severity).toBe("urgent");
    expect(result.items[2]!.severity).toBe("unknown");
  });
});