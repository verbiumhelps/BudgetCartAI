# BE: Security/compliance — secrets rotation (0642)

## objective
Implement and verify backend hardening for Security/compliance: secrets rotation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0642.md
- .\docs\backend\phases\0642-Security/compliance-secrets-rotation.md
- .\supabase\migrations\20260218_0642_Security/compliance_secrets_rotation.sql
- .\__tests__\backend\0642.Security/compliance.secrets-rotation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — secrets rotation (0642)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0642'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0642'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0642

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0642
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0642 -CheckMarker

## completion_marker
PHASE 0642 COMPLETE
