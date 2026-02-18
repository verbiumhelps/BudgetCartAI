-- volatility view scaffold (7d/30d)
create or replace view public.price_volatility as
select
  store_item_id,
  min(price) filter (where captured_at >= now() - interval '7 days')  as min_7d,
  max(price) filter (where captured_at >= now() - interval '7 days')  as max_7d,
  avg(price) filter (where captured_at >= now() - interval '7 days')  as avg_7d,
  min(price) filter (where captured_at >= now() - interval '30 days') as min_30d,
  max(price) filter (where captured_at >= now() - interval '30 days') as max_30d,
  avg(price) filter (where captured_at >= now() - interval '30 days') as avg_30d
from public.prices
group by store_item_id;

