# Budget + Savings Consistency Checks

## Invariants
- weekly_spend rollup must match receipts sum for the week
- savings_events must not reduce spend; it is an informational feed
- projected savings must disclose assumptions

## Tests
- receipts added -> weekly_spend increases deterministically
- deleting a receipt -> weekly_spend decreases deterministically
- savings event added -> does NOT change weekly_spend

