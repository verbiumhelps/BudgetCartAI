# BE: Migrations discipline — backcompat checks (0645)

## objective
Implement and verify backend hardening for Migrations discipline: backcompat checks with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0645.md
- .\docs\backend\phases\0645-Migrations-discipline-backcompat-checks.md
- .\supabase\migrations\20260218_0645_Migrations_discipline_backcompat_checks.sql
- .\__tests__\backend\0645.Migrations-discipline.backcompat-checks.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — backcompat checks (0645)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0645'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0645'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0645

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0645
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0645 -CheckMarker

## completion_marker
PHASE 0645 COMPLETE
