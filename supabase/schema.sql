-- BudgetCartAI — Backend Foundation (stubs)
-- NOTE: This is a deterministic starter schema suitable for Supabase.
-- Apply via Supabase migrations when backend is activated.

create table if not exists public.households (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.household_members (
  household_id uuid not null references public.households(id) on delete cascade,
  user_id uuid not null,
  role text not null default 'member',
  created_at timestamptz not null default now(),
  primary key (household_id, user_id)
);

create table if not exists public.canonical_items (
  id uuid primary key default gen_random_uuid(),
  canonical_name text not null,
  category text not null default 'other',
  default_unit text not null default 'each',
  created_at timestamptz not null default now()
);

create table if not exists public.pantry_entries (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  item_id uuid not null references public.canonical_items(id) on delete restrict,
  quantity numeric not null default 0,
  unit text not null default 'each',
  expires_on date null,
  updated_at timestamptz not null default now()
);

create table if not exists public.shopping_lists (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  week_of date not null,
  created_at timestamptz not null default now()
);

create table if not exists public.shopping_list_items (
  id uuid primary key default gen_random_uuid(),
  list_id uuid not null references public.shopping_lists(id) on delete cascade,
  item_id uuid not null references public.canonical_items(id) on delete restrict,
  quantity numeric not null default 1,
  unit text not null default 'each',
  target_max_cents integer null,
  checked boolean not null default false
);

create table if not exists public.store_prices (
  id uuid primary key default gen_random_uuid(),
  store_id uuid not null,
  item_id uuid not null references public.canonical_items(id) on delete restrict,
  price_cents integer not null,
  captured_at timestamptz not null default now()
);

create table if not exists public.recommendations (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  kind text not null,
  title text not null,
  detail text not null,
  impact_cents integer null,
  created_at timestamptz not null default now()
);

