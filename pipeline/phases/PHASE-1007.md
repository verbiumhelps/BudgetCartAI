# BE: Observability — audit trails (1007)

## objective
Implement and verify backend hardening for Observability: audit trails with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1007.md
- .\docs\backend\phases\1007-Observability-audit-trails.md
- .\supabase\migrations\20260218_1007_Observability_audit_trails.sql
- .\__tests__\backend\1007.Observability.audit-trails.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — audit trails (1007)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1007'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1007'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1007

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1007
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1007 -CheckMarker

## completion_marker
PHASE 1007 COMPLETE
