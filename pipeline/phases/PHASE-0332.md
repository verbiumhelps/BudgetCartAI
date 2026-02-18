# BE: Observability — audit trails (0332)

## objective
Implement and verify backend hardening for Observability: audit trails with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0332.md
- .\docs\backend\phases\0332-Observability-audit-trails.md
- .\supabase\migrations\20260218_0332_Observability_audit_trails.sql
- .\__tests__\backend\0332.Observability.audit-trails.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — audit trails (0332)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0332'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0332'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0332

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0332
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0332 -CheckMarker

## completion_marker
PHASE 0332 COMPLETE
