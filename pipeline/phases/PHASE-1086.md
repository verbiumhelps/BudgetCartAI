# BE: Migrations discipline — drift detect (1086)

## objective
Implement and verify backend hardening for Migrations discipline: drift detect with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1086.md
- .\docs\backend\phases\1086-Migrations-discipline-drift-detect.md
- .\supabase\migrations\20260218_1086_Migrations_discipline_drift_detect.sql
- .\__tests__\backend\1086.Migrations-discipline.drift-detect.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — drift detect (1086)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1086'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1086'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1086

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1086
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1086 -CheckMarker

## completion_marker
PHASE 1086 COMPLETE
