# BE: Migrations discipline — migration smoke (0339)

## objective
Implement and verify backend hardening for Migrations discipline: migration smoke with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0339.md
- .\docs\backend\phases\0339-Migrations-discipline-migration-smoke.md
- .\supabase\migrations\20260218_0339_Migrations_discipline_migration_smoke.sql
- .\__tests__\backend\0339.Migrations-discipline.migration-smoke.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — migration smoke (0339)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0339'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0339'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0339

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0339
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0339 -CheckMarker

## completion_marker
PHASE 0339 COMPLETE
