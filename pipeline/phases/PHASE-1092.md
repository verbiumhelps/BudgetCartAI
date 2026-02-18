# BE: Security/compliance — secrets rotation (1092)

## objective
Implement and verify backend hardening for Security/compliance: secrets rotation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1092.md
- .\docs\backend\phases\1092-Security/compliance-secrets-rotation.md
- .\supabase\migrations\20260218_1092_Security/compliance_secrets_rotation.sql
- .\__tests__\backend\1092.Security/compliance.secrets-rotation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — secrets rotation (1092)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1092'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1092'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1092

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1092
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1092 -CheckMarker

## completion_marker
PHASE 1092 COMPLETE
