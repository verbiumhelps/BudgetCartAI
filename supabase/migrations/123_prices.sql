-- prices scaffold
create table if not exists public.prices (
  id uuid primary key default gen_random_uuid(),
  store_item_id uuid not null references public.store_items(id) on delete cascade,
  price numeric not null,
  unit_price numeric,
  currency text not null default 'USD',
  captured_at timestamptz not null default now()
);

create index if not exists idx_prices_store_item_time on public.prices(store_item_id, captured_at desc);

