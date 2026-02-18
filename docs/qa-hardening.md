# QA / Hardening

This repo’s strict quality gates are:
- ESLint (\
pm run lint\)
- TypeScript (\
pm run typecheck\)

This phase adds \scripts/selfcheck.ps1\ as an optional artifact presence validator, without adding new dependencies.
Next QA steps (later) should introduce a real test runner only when dependencies and CI strategy are finalized.

