# BE: Migrations discipline — backcompat checks (0960)

## objective
Implement and verify backend hardening for Migrations discipline: backcompat checks with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0960.md
- .\docs\backend\phases\0960-Migrations-discipline-backcompat-checks.md
- .\supabase\migrations\20260218_0960_Migrations_discipline_backcompat_checks.sql
- .\__tests__\backend\0960.Migrations-discipline.backcompat-checks.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — backcompat checks (0960)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0960'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0960'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0960

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0960
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0960 -CheckMarker

## completion_marker
PHASE 0960 COMPLETE
