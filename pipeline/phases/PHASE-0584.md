# BE: Observability — correlation ids (0584)

## objective
Implement and verify backend hardening for Observability: correlation ids with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0584.md
- .\docs\backend\phases\0584-Observability-correlation-ids.md
- .\supabase\migrations\20260218_0584_Observability_correlation_ids.sql
- .\__tests__\backend\0584.Observability.correlation-ids.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — correlation ids (0584)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0584'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0584'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0584

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0584
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0584 -CheckMarker

## completion_marker
PHASE 0584 COMPLETE
