# BE: Migrations discipline — rollback sim (0492)

## objective
Implement and verify backend hardening for Migrations discipline: rollback sim with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0492.md
- .\docs\backend\phases\0492-Migrations-discipline-rollback-sim.md
- .\supabase\migrations\20260218_0492_Migrations_discipline_rollback_sim.sql
- .\__tests__\backend\0492.Migrations-discipline.rollback-sim.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — rollback sim (0492)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0492'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0492'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0492

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0492
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0492 -CheckMarker

## completion_marker
PHASE 0492 COMPLETE
