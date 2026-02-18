# BE: Observability — correlation ids (0674)

## objective
Implement and verify backend hardening for Observability: correlation ids with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0674.md
- .\docs\backend\phases\0674-Observability-correlation-ids.md
- .\supabase\migrations\20260218_0674_Observability_correlation_ids.sql
- .\__tests__\backend\0674.Observability.correlation-ids.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — correlation ids (0674)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0674'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0674'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0674

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0674
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0674 -CheckMarker

## completion_marker
PHASE 0674 COMPLETE
