export type SearchItem = { id?: string; label: string; canonical_item_id?: string };

export function localSearch(query: string, items: SearchItem[]): SearchItem[] {
  const q = query.trim().toLowerCase();
  if (!q) return [];
  return items
    .filter(i => i.label.toLowerCase().includes(q))
    .slice(0, 25);
}

