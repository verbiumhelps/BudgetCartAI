import { describe, it, expect } from "vitest";
import { calculateSavingsProjection } from "../../src/core/savings/savings-engine";

describe("Savings Projection Engine", () => {
  it("calculates projected savings correctly", () => {
    const result = calculateSavingsProjection([
      { id: "1", name: "Milk", quantity: 2, price: 4.00, optimizedPrice: 3.50 },
      { id: "2", name: "Eggs", quantity: 1, price: 5.00 }
    ]);

    expect(result.originalTotal).toBe(13.00);
    expect(result.optimizedTotal).toBe(12.00);
    expect(result.projectedSavings).toBe(1.00);
    expect(result.savingsPercentage).toBe(7.69);
  });

  it("returns zero savings if no optimized prices exist", () => {
    const result = calculateSavingsProjection([
      { id: "1", name: "Bread", quantity: 1, price: 3.00 }
    ]);

    expect(result.projectedSavings).toBe(0);
    expect(result.savingsPercentage).toBe(0);
  });
});