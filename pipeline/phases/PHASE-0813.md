# BE: Security/compliance — delete cascade (0813)

## objective
Implement and verify backend hardening for Security/compliance: delete cascade with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0813.md
- .\docs\backend\phases\0813-Security/compliance-delete-cascade.md
- .\supabase\migrations\20260218_0813_Security/compliance_delete_cascade.sql
- .\__tests__\backend\0813.Security/compliance.delete-cascade.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — delete cascade (0813)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0813'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0813'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0813

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0813
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0813 -CheckMarker

## completion_marker
PHASE 0813 COMPLETE
