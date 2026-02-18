# BE: Security/compliance — backup/restore drills (1011)

## objective
Implement and verify backend hardening for Security/compliance: backup/restore drills with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1011.md
- .\docs\backend\phases\1011-Security/compliance-backup/restore-drills.md
- .\supabase\migrations\20260218_1011_Security/compliance_backup/restore_drills.sql
- .\__tests__\backend\1011.Security/compliance.backup/restore-drills.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — backup/restore drills (1011)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1011'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1011'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1011

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1011
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1011 -CheckMarker

## completion_marker
PHASE 1011 COMPLETE
