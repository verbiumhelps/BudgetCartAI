# BE: Security/compliance — secrets rotation (0327)

## objective
Implement and verify backend hardening for Security/compliance: secrets rotation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0327.md
- .\docs\backend\phases\0327-Security/compliance-secrets-rotation.md
- .\supabase\migrations\20260218_0327_Security/compliance_secrets_rotation.sql
- .\__tests__\backend\0327.Security/compliance.secrets-rotation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — secrets rotation (0327)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0327'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0327'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0327

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0327
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0327 -CheckMarker

## completion_marker
PHASE 0327 COMPLETE
