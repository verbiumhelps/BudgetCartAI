# BE: Migrations discipline — rollback sim (1032)

## objective
Implement and verify backend hardening for Migrations discipline: rollback sim with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1032.md
- .\docs\backend\phases\1032-Migrations-discipline-rollback-sim.md
- .\supabase\migrations\20260218_1032_Migrations_discipline_rollback_sim.sql
- .\__tests__\backend\1032.Migrations-discipline.rollback-sim.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — rollback sim (1032)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1032'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1032'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1032

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1032
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1032 -CheckMarker

## completion_marker
PHASE 1032 COMPLETE
