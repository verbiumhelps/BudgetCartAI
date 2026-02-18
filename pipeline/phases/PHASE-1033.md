# BE: Query performance — plan snapshots (1033)

## objective
Implement and verify backend hardening for Query performance: plan snapshots with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1033.md
- .\docs\backend\phases\1033-Query-performance-plan-snapshots.md
- .\supabase\migrations\20260218_1033_Query_performance_plan_snapshots.sql
- .\__tests__\backend\1033.Query-performance.plan-snapshots.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — plan snapshots (1033)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1033'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1033'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1033

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1033
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1033 -CheckMarker

## completion_marker
PHASE 1033 COMPLETE
