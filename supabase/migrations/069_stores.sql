-- stores scaffold
create table if not exists public.stores (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  region text,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

