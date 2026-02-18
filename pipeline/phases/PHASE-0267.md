# BE: Migrations discipline — rollback sim (0267)

## objective
Implement and verify backend hardening for Migrations discipline: rollback sim with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0267.md
- .\docs\backend\phases\0267-Migrations-discipline-rollback-sim.md
- .\supabase\migrations\20260218_0267_Migrations_discipline_rollback_sim.sql
- .\__tests__\backend\0267.Migrations-discipline.rollback-sim.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — rollback sim (0267)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0267'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0267'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0267

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0267
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0267 -CheckMarker

## completion_marker
PHASE 0267 COMPLETE
