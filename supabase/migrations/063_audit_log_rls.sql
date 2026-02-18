-- RLS scaffold for audit_log
alter table public.audit_log enable row level security;

-- TODO policies:
-- - household members can read audit_log rows for their household
-- - no client-side inserts/updates/deletes (use RPC/server later)

