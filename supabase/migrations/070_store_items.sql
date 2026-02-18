-- store_items scaffold (store-specific sku/meta -> canonical item)
create table if not exists public.store_items (
  id uuid primary key default gen_random_uuid(),
  store_id uuid not null references public.stores(id) on delete cascade,
  canonical_item_id uuid references public.canonical_items(id) on delete set null,
  sku text,
  label text,
  pack_size text,
  created_at timestamptz not null default now()
);

