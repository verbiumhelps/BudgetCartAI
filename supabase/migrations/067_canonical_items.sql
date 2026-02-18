-- canonical_items scaffold
create table if not exists public.canonical_items (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  brand text,
  size text,
  category text,
  created_at timestamptz not null default now()
);

