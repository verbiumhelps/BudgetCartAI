# BE: Security/compliance — backup/restore drills (0471)

## objective
Implement and verify backend hardening for Security/compliance: backup/restore drills with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0471.md
- .\docs\backend\phases\0471-Security/compliance-backup/restore-drills.md
- .\supabase\migrations\20260218_0471_Security/compliance_backup/restore_drills.sql
- .\__tests__\backend\0471.Security/compliance.backup/restore-drills.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — backup/restore drills (0471)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0471'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0471'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0471

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0471
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0471 -CheckMarker

## completion_marker
PHASE 0471 COMPLETE
