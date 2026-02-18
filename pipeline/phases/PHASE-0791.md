# BE: Observability — dashboards (0791)

## objective
Implement and verify backend hardening for Observability: dashboards with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0791.md
- .\docs\backend\phases\0791-Observability-dashboards.md
- .\supabase\migrations\20260218_0791_Observability_dashboards.sql
- .\__tests__\backend\0791.Observability.dashboards.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — dashboards (0791)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0791'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0791'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0791

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0791
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0791 -CheckMarker

## completion_marker
PHASE 0791 COMPLETE
