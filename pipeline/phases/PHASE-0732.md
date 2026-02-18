# BE: Security/compliance — secrets rotation (0732)

## objective
Implement and verify backend hardening for Security/compliance: secrets rotation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0732.md
- .\docs\backend\phases\0732-Security/compliance-secrets-rotation.md
- .\supabase\migrations\20260218_0732_Security/compliance_secrets_rotation.sql
- .\__tests__\backend\0732.Security/compliance.secrets-rotation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — secrets rotation (0732)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0732'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0732'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0732

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0732
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0732 -CheckMarker

## completion_marker
PHASE 0732 COMPLETE
