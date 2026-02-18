-- household_members join table scaffold
create table if not exists public.household_members (
  household_id uuid not null references public.households(id) on delete cascade,
  user_id uuid not null,
  role text not null check (role in ('owner','admin','member')) default 'member',
  created_at timestamptz not null default now(),
  primary key (household_id, user_id)
);

