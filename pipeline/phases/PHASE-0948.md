# BE: Security/compliance — delete cascade (0948)

## objective
Implement and verify backend hardening for Security/compliance: delete cascade with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0948.md
- .\docs\backend\phases\0948-Security/compliance-delete-cascade.md
- .\supabase\migrations\20260218_0948_Security/compliance_delete_cascade.sql
- .\__tests__\backend\0948.Security/compliance.delete-cascade.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — delete cascade (0948)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0948'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0948'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0948

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0948
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0948 -CheckMarker

## completion_marker
PHASE 0948 COMPLETE
