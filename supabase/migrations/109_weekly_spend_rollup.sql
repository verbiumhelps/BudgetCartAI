-- weekly spend rollup scaffold (deterministic week boundaries)
-- NOTE: define week start (e.g., Monday) consistently. Adjust as needed.
create or replace view public.weekly_spend as
select
  household_id,
  date_trunc('week', purchased_at::timestamptz) as week_start,
  sum(total) as total_spend
from public.receipts
group by household_id, date_trunc('week', purchased_at::timestamptz);

