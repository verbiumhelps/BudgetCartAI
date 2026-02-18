# BE: Security/compliance — backup/restore drills (0156)

## objective
Implement and verify backend hardening for Security/compliance: backup/restore drills with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0156.md
- .\docs\backend\phases\0156-Security/compliance-backup/restore-drills.md
- .\supabase\migrations\20260218_0156_Security/compliance_backup/restore_drills.sql
- .\__tests__\backend\0156.Security/compliance.backup/restore-drills.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — backup/restore drills (0156)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0156'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0156'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0156

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0156
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0156 -CheckMarker

## completion_marker
PHASE 0156 COMPLETE
