# BE: Query performance — materialized views (1087)

## objective
Implement and verify backend hardening for Query performance: materialized views with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1087.md
- .\docs\backend\phases\1087-Query-performance-materialized-views.md
- .\supabase\migrations\20260218_1087_Query_performance_materialized_views.sql
- .\__tests__\backend\1087.Query-performance.materialized-views.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — materialized views (1087)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1087'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1087'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1087

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1087
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1087 -CheckMarker

## completion_marker
PHASE 1087 COMPLETE
