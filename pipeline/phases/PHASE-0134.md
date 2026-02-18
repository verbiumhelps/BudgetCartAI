# BE: Observability — correlation ids (0134)

## objective
Implement and verify backend hardening for Observability: correlation ids with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0134.md
- .\docs\backend\phases\0134-Observability-correlation-ids.md
- .\supabase\migrations\20260218_0134_Observability_correlation_ids.sql
- .\__tests__\backend\0134.Observability.correlation-ids.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — correlation ids (0134)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0134'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0134'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0134

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0134
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0134 -CheckMarker

## completion_marker
PHASE 0134 COMPLETE
