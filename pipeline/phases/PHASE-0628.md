# BE: Query performance — plan snapshots (0628)

## objective
Implement and verify backend hardening for Query performance: plan snapshots with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0628.md
- .\docs\backend\phases\0628-Query-performance-plan-snapshots.md
- .\supabase\migrations\20260218_0628_Query_performance_plan_snapshots.sql
- .\__tests__\backend\0628.Query-performance.plan-snapshots.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — plan snapshots (0628)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0628'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0628'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0628

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0628
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0628 -CheckMarker

## completion_marker
PHASE 0628 COMPLETE
