# BE: Observability — dashboards (0341)

## objective
Implement and verify backend hardening for Observability: dashboards with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0341.md
- .\docs\backend\phases\0341-Observability-dashboards.md
- .\supabase\migrations\20260218_0341_Observability_dashboards.sql
- .\__tests__\backend\0341.Observability.dashboards.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — dashboards (0341)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0341'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0341'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0341

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0341
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0341 -CheckMarker

## completion_marker
PHASE 0341 COMPLETE
