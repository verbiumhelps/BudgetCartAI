-- pantry_items scaffold (household scoped)
create table if not exists public.pantry_items (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  canonical_item_id uuid references public.canonical_items(id) on delete set null,
  label text not null,
  created_at timestamptz not null default now()
);

