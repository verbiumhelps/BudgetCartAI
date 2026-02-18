# Price Normalization Rules

## Goals
- compute unit_price consistently for comparisons

## Inputs
- store_items.pack_size (e.g., '12 oz', '1 lb', '6 ct')
- prices.price

## Rules (v0)
- if unit_price provided, accept
- else compute when pack_size parseable
- else leave null and exclude from unit comparisons

