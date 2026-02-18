-- grocery_list_items scaffold
create table if not exists public.grocery_list_items (
  id uuid primary key default gen_random_uuid(),
  list_id uuid not null references public.grocery_lists(id) on delete cascade,
  canonical_item_id uuid references public.canonical_items(id) on delete set null,
  label text not null,
  qty numeric,
  unit text,
  note text,
  is_checked boolean not null default false,
  created_at timestamptz not null default now()
);

