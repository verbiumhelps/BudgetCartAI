# BE: Security/compliance — secrets rotation (1047)

## objective
Implement and verify backend hardening for Security/compliance: secrets rotation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1047.md
- .\docs\backend\phases\1047-Security/compliance-secrets-rotation.md
- .\supabase\migrations\20260218_1047_Security/compliance_secrets_rotation.sql
- .\__tests__\backend\1047.Security/compliance.secrets-rotation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — secrets rotation (1047)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1047'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1047'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1047

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1047
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1047 -CheckMarker

## completion_marker
PHASE 1047 COMPLETE
