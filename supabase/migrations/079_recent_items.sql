-- recent items scaffold (materialized view or table)
-- Option A: table updated by triggers on grocery_list_items + pantry_events
create table if not exists public.recent_items (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  user_id uuid not null,
  label text not null,
  canonical_item_id uuid,
  last_used_at timestamptz not null default now()
);

