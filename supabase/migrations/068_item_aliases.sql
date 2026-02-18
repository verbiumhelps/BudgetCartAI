-- item_aliases scaffold (store label -> canonical item)
create table if not exists public.item_aliases (
  id uuid primary key default gen_random_uuid(),
  store_label text not null,
  canonical_item_id uuid not null references public.canonical_items(id) on delete cascade,
  created_at timestamptz not null default now()
);

