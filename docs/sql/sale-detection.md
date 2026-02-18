# Sale Detection Heuristic (v0)

## Inputs
- latest price
- 30d average price

## Rule (v0)
- if latest <= (avg_30d * (1 - threshold)) => sale
- start threshold at 10–15%

## Notes
- avoid false positives for irregular items
- incorporate unit_price when available

