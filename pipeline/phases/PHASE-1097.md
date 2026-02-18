# BE: Observability — audit trails (1097)

## objective
Implement and verify backend hardening for Observability: audit trails with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1097.md
- .\docs\backend\phases\1097-Observability-audit-trails.md
- .\supabase\migrations\20260218_1097_Observability_audit_trails.sql
- .\__tests__\backend\1097.Observability.audit-trails.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — audit trails (1097)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1097'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1097'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1097

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1097
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1097 -CheckMarker

## completion_marker
PHASE 1097 COMPLETE
