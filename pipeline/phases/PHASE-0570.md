# BE: Security/compliance — retention enforcement (0570)

## objective
Implement and verify backend hardening for Security/compliance: retention enforcement with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0570.md
- .\docs\backend\phases\0570-Security/compliance-retention-enforcement.md
- .\supabase\migrations\20260218_0570_Security/compliance_retention_enforcement.sql
- .\__tests__\backend\0570.Security/compliance.retention-enforcement.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — retention enforcement (0570)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0570'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0570'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0570

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0570
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0570 -CheckMarker

## completion_marker
PHASE 0570 COMPLETE
