# Rollups Caching Strategy

## Candidates
- weekly_spend (view now; materialize later if needed)
- expiring soon (view now)

## Approach
- start with views + indexes
- add materialized views if query costs grow
- refresh strategy documented before enabling

