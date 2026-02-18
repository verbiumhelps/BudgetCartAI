# BE: Migrations discipline — migration smoke (0789)

## objective
Implement and verify backend hardening for Migrations discipline: migration smoke with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0789.md
- .\docs\backend\phases\0789-Migrations-discipline-migration-smoke.md
- .\supabase\migrations\20260218_0789_Migrations_discipline_migration_smoke.sql
- .\__tests__\backend\0789.Migrations-discipline.migration-smoke.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — migration smoke (0789)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0789'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0789'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0789

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0789
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0789 -CheckMarker

## completion_marker
PHASE 0789 COMPLETE
