export interface Store {
  id: string;
  name: string;
  region: string;
  createdAt: string;
}

export interface PriceEntry {
  id: string;
  storeId: string;
  itemName: string;
  priceCents: number;
  capturedAt: string;
}
