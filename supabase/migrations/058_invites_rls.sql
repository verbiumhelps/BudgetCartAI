-- RLS scaffold for household_invites
alter table public.household_invites enable row level security;

-- TODO policies:
-- - only owner/admin can create/read/delete invites for their household
-- - invited email can read invite by token via RPC (recommended)

