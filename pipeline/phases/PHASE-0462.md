# BE: Security/compliance — secrets rotation (0462)

## objective
Implement and verify backend hardening for Security/compliance: secrets rotation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0462.md
- .\docs\backend\phases\0462-Security/compliance-secrets-rotation.md
- .\supabase\migrations\20260218_0462_Security/compliance_secrets_rotation.sql
- .\__tests__\backend\0462.Security/compliance.secrets-rotation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — secrets rotation (0462)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0462'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0462'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0462

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0462
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0462 -CheckMarker

## completion_marker
PHASE 0462 COMPLETE
