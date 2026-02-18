-- alert preferences scaffold
create table if not exists public.alert_preferences (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  user_id uuid not null,
  store_id uuid references public.stores(id) on delete set null,
  category text,
  canonical_item_id uuid references public.canonical_items(id) on delete set null,
  is_enabled boolean not null default true,
  created_at timestamptz not null default now()
);

