# BE: Migrations discipline — rollback sim (0357)

## objective
Implement and verify backend hardening for Migrations discipline: rollback sim with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0357.md
- .\docs\backend\phases\0357-Migrations-discipline-rollback-sim.md
- .\supabase\migrations\20260218_0357_Migrations_discipline_rollback_sim.sql
- .\__tests__\backend\0357.Migrations-discipline.rollback-sim.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — rollback sim (0357)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0357'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0357'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0357

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0357
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0357 -CheckMarker

## completion_marker
PHASE 0357 COMPLETE
