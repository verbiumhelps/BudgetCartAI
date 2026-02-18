# Pricing Ingest Validation Tests

## Reject cases
- missing store_item_id
- missing price
- price < 0
- invalid captured_at format

## Accept cases
- unit_price missing but pack_size parseable later
- captured_at omitted (defaults now)

## Outputs
- inserted count
- rejected rows file

