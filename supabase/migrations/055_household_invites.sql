-- household_invites scaffold
create table if not exists public.household_invites (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  email text not null,
  role text not null check (role in ('admin','member')) default 'member',
  token text not null,
  expires_at timestamptz not null,
  created_at timestamptz not null default now()
);

