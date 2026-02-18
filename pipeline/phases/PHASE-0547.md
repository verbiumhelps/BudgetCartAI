# BE: Query performance — materialized views (0547)

## objective
Implement and verify backend hardening for Query performance: materialized views with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0547.md
- .\docs\backend\phases\0547-Query-performance-materialized-views.md
- .\supabase\migrations\20260218_0547_Query_performance_materialized_views.sql
- .\__tests__\backend\0547.Query-performance.materialized-views.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — materialized views (0547)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0547'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0547'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0547

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0547
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0547 -CheckMarker

## completion_marker
PHASE 0547 COMPLETE
