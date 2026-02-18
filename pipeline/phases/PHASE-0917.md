# BE: Observability — audit trails (0917)

## objective
Implement and verify backend hardening for Observability: audit trails with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0917.md
- .\docs\backend\phases\0917-Observability-audit-trails.md
- .\supabase\migrations\20260218_0917_Observability_audit_trails.sql
- .\__tests__\backend\0917.Observability.audit-trails.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — audit trails (0917)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0917'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0917'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0917

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0917
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0917 -CheckMarker

## completion_marker
PHASE 0917 COMPLETE
