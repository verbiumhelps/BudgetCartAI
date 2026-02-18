-- receipts scaffold (manual totals first)
create table if not exists public.receipts (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  store_id uuid references public.stores(id) on delete set null,
  purchased_at date not null,
  total numeric not null,
  created_at timestamptz not null default now()
);

