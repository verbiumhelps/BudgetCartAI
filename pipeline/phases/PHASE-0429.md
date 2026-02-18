# BE: Migrations discipline — migration smoke (0429)

## objective
Implement and verify backend hardening for Migrations discipline: migration smoke with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0429.md
- .\docs\backend\phases\0429-Migrations-discipline-migration-smoke.md
- .\supabase\migrations\20260218_0429_Migrations_discipline_migration_smoke.sql
- .\__tests__\backend\0429.Migrations-discipline.migration-smoke.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — migration smoke (0429)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0429'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0429'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0429

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0429
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0429 -CheckMarker

## completion_marker
PHASE 0429 COMPLETE
