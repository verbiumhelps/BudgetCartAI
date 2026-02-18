-- favorites scaffold (user + household scoped)
create table if not exists public.favorites (
  household_id uuid not null references public.households(id) on delete cascade,
  user_id uuid not null,
  canonical_item_id uuid references public.canonical_items(id) on delete cascade,
  label text not null,
  created_at timestamptz not null default now(),
  primary key (household_id, user_id, label)
);

