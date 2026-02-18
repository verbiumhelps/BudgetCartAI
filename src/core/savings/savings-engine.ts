export interface CartItem {
  id: string;
  name: string;
  quantity: number;
  price: number;
  optimizedPrice?: number;
}

export interface SavingsProjection {
  originalTotal: number;
  optimizedTotal: number;
  projectedSavings: number;
  savingsPercentage: number;
}

export function calculateSavingsProjection(items: CartItem[]): SavingsProjection {
  const originalTotal = items.reduce((sum, item) => {
    return sum + item.price * item.quantity;
  }, 0);

  const optimizedTotal = items.reduce((sum, item) => {
    const effectivePrice = item.optimizedPrice ?? item.price;
    return sum + effectivePrice * item.quantity;
  }, 0);

  const projectedSavings = originalTotal - optimizedTotal;

  const savingsPercentage =
    originalTotal === 0
      ? 0
      : Number(((projectedSavings / originalTotal) * 100).toFixed(2));

  return {
    originalTotal: Number(originalTotal.toFixed(2)),
    optimizedTotal: Number(optimizedTotal.toFixed(2)),
    projectedSavings: Number(projectedSavings.toFixed(2)),
    savingsPercentage
  };
}