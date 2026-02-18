# BE: Observability — audit trails (0512)

## objective
Implement and verify backend hardening for Observability: audit trails with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0512.md
- .\docs\backend\phases\0512-Observability-audit-trails.md
- .\supabase\migrations\20260218_0512_Observability_audit_trails.sql
- .\__tests__\backend\0512.Observability.audit-trails.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — audit trails (0512)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0512'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0512'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0512

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0512
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0512 -CheckMarker

## completion_marker
PHASE 0512 COMPLETE
