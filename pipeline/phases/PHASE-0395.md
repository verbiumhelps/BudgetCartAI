# BE: Observability — structured logs (0395)

## objective
Implement and verify backend hardening for Observability: structured logs with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0395.md
- .\docs\backend\phases\0395-Observability-structured-logs.md
- .\supabase\migrations\20260218_0395_Observability_structured_logs.sql
- .\__tests__\backend\0395.Observability.structured-logs.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — structured logs (0395)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0395'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0395'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0395

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0395
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0395 -CheckMarker

## completion_marker
PHASE 0395 COMPLETE
