-- pantry_events scaffold (audit trail for items)
create table if not exists public.pantry_events (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  pantry_item_id uuid references public.pantry_items(id) on delete set null,
  event_type text not null check (event_type in ('add','consume','adjust')) ,
  delta numeric,
  note text,
  created_at timestamptz not null default now()
);

