# Price Query Index Tuning

## Current index
- prices(store_item_id, captured_at desc)

## Candidates
- prices(captured_at desc) for global feeds
- store_items(store_id, canonical_item_id)

## Measure
- EXPLAIN ANALYZE key queries before changes

