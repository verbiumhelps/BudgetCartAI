# BE: Migrations discipline — migration smoke (1014)

## objective
Implement and verify backend hardening for Migrations discipline: migration smoke with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1014.md
- .\docs\backend\phases\1014-Migrations-discipline-migration-smoke.md
- .\supabase\migrations\20260218_1014_Migrations_discipline_migration_smoke.sql
- .\__tests__\backend\1014.Migrations-discipline.migration-smoke.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — migration smoke (1014)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1014'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1014'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1014

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1014
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1014 -CheckMarker

## completion_marker
PHASE 1014 COMPLETE
