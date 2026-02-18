# BE: Security/compliance — backup/restore drills (0336)

## objective
Implement and verify backend hardening for Security/compliance: backup/restore drills with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0336.md
- .\docs\backend\phases\0336-Security/compliance-backup/restore-drills.md
- .\supabase\migrations\20260218_0336_Security/compliance_backup/restore_drills.sql
- .\__tests__\backend\0336.Security/compliance.backup/restore-drills.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — backup/restore drills (0336)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0336'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0336'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0336

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0336
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0336 -CheckMarker

## completion_marker
PHASE 0336 COMPLETE
