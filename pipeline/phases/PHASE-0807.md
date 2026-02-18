# BE: Migrations discipline — rollback sim (0807)

## objective
Implement and verify backend hardening for Migrations discipline: rollback sim with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0807.md
- .\docs\backend\phases\0807-Migrations-discipline-rollback-sim.md
- .\supabase\migrations\20260218_0807_Migrations_discipline_rollback_sim.sql
- .\__tests__\backend\0807.Migrations-discipline.rollback-sim.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — rollback sim (0807)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0807'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0807'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0807

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0807
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0807 -CheckMarker

## completion_marker
PHASE 0807 COMPLETE
