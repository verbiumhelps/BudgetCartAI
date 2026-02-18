# BE: Query performance — materialized views (1042)

## objective
Implement and verify backend hardening for Query performance: materialized views with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1042.md
- .\docs\backend\phases\1042-Query-performance-materialized-views.md
- .\supabase\migrations\20260218_1042_Query_performance_materialized_views.sql
- .\__tests__\backend\1042.Query-performance.materialized-views.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — materialized views (1042)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1042'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1042'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1042

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1042
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1042 -CheckMarker

## completion_marker
PHASE 1042 COMPLETE
