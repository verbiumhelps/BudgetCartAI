# Admin Ingest (Pricing)

## Constraints
- admin-only (service role key; never shipped to client)
- validate CSV schema before insert
- reject rows with missing store_item_id or price

## Checks
- store_item_id exists
- price >= 0
- captured_at parseable

## Logging
- write bad rows to a reject file
- summary counts (inserted/rejected)

