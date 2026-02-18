# Release Readiness Pack

## What CI guarantees today
- ESLint passes
- TypeScript passes
- Deterministic phase runner advances state

## What remains before a public beta
- Real test runner + targeted unit tests for deterministic modules
- Supabase migrations + RLS policies + auth integration
- Analytics + crash reporting adapters
- Paywall integration (store kits) and receipt validation (if required)

## Hand-off artifacts
- docs/idea-brief.md
- docs/architecture-north-star.md
- docs/domain-model.md
- supabase/schema.sql
- src/domain + src/state + src/ai + src/monetization modules
- GitHub Actions CI workflow

