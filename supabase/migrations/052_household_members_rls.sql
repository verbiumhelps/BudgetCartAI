-- RLS scaffold for households + household_members
alter table public.households enable row level security;
alter table public.household_members enable row level security;

-- TODO policies:
-- - members can read their households
-- - only owner/admin can insert/update/delete household_members
-- - only owner/admin can update household fields

