-- budgets scaffold (weekly budget per household)
create table if not exists public.budgets (
  household_id uuid primary key references public.households(id) on delete cascade,
  weekly_budget numeric not null default 0,
  currency text not null default 'USD',
  updated_at timestamptz not null default now()
);

