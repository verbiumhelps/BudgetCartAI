-- RLS scaffold for pantry_items
alter table public.pantry_items enable row level security;

-- TODO policies:
-- - household members can read/write pantry_items for their household
-- - deny cross-household access

