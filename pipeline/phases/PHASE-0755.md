# BE: Observability — structured logs (0755)

## objective
Implement and verify backend hardening for Observability: structured logs with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0755.md
- .\docs\backend\phases\0755-Observability-structured-logs.md
- .\supabase\migrations\20260218_0755_Observability_structured_logs.sql
- .\__tests__\backend\0755.Observability.structured-logs.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — structured logs (0755)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0755'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0755'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0755

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0755
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0755 -CheckMarker

## completion_marker
PHASE 0755 COMPLETE
