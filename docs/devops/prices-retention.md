# Prices Retention + Partitioning

## Retention
- keep all history in dev initially
- define prod retention (e.g., 12–24 months) once volume known

## Partitioning (optional)
- partition by month on captured_at if table grows large
- keep latest-price view indexed

## Policy
- never delete latest snapshots needed for analytics without replacement

