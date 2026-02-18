-- placeholder for projected savings model inputs
-- (actual logic may live in RPC / edge function later)
create table if not exists public.projected_savings_inputs (
  household_id uuid primary key references public.households(id) on delete cascade,
  assumptions jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

