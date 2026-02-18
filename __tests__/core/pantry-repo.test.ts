import { describe, it, expect } from "vitest";
import { InMemoryPantryRepo } from "../../src/core/pantry/pantry-repo";

describe("InMemoryPantryRepo", () => {
  it("upserts and reads item deterministically", async () => {
    const repo = new InMemoryPantryRepo();
    const now = "2026-02-17";

    const item = await repo.upsert(
      { id: "a", canonicalName: "  Milk   2%  ", quantity: 2, unit: "each", category: "dairy", expiresOn: "2026-02-20" },
      now
    );

    expect(item.canonicalName).toBe("Milk 2%");
    expect(item.createdAt).toBe(now);
    expect(item.updatedAt).toBe(now);

    const fetched = await repo.get("a");
    expect(fetched?.id).toBe("a");
    expect(fetched?.canonicalName).toBe("Milk 2%");
  });

  it("lists items ordered by expiry then name then id", async () => {
    const repo = new InMemoryPantryRepo();
    const now = "2026-02-17";

    await repo.upsert({ id: "b", canonicalName: "Bread", quantity: 1, unit: "each", expiresOn: "2026-02-19" }, now);
    await repo.upsert({ id: "a", canonicalName: "Apples", quantity: 6, unit: "each", expiresOn: "2026-02-19" }, now);
    await repo.upsert({ id: "c", canonicalName: "Rice", quantity: 1, unit: "lb" }, now);

    const items = await repo.list();
    expect(items.map((x) => x.id)).toEqual(["a", "b", "c"]);
  });

  it("filters expired items by default", async () => {
    const repo = new InMemoryPantryRepo();
    const now = "2026-02-17";

    await repo.upsert({ id: "x", canonicalName: "Yogurt", quantity: 1, unit: "each", expiresOn: "2026-02-10" }, now);
    await repo.upsert({ id: "y", canonicalName: "Eggs", quantity: 1, unit: "each", expiresOn: "2026-02-25" }, now);

    const items = await repo.list({ expiresBefore: "2026-02-17" });
    expect(items.map((x) => x.id)).toEqual(["y"]);
  });
});