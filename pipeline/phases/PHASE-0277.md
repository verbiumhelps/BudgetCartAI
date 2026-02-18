# BE: Query performance — materialized views (0277)

## objective
Implement and verify backend hardening for Query performance: materialized views with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0277.md
- .\docs\backend\phases\0277-Query-performance-materialized-views.md
- .\supabase\migrations\20260218_0277_Query_performance_materialized_views.sql
- .\__tests__\backend\0277.Query-performance.materialized-views.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — materialized views (0277)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0277'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0277'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0277

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0277
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0277 -CheckMarker

## completion_marker
PHASE 0277 COMPLETE
