# BE: Migrations discipline — drift detect (0186)

## objective
Implement and verify backend hardening for Migrations discipline: drift detect with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0186.md
- .\docs\backend\phases\0186-Migrations-discipline-drift-detect.md
- .\supabase\migrations\20260218_0186_Migrations_discipline_drift_detect.sql
- .\__tests__\backend\0186.Migrations-discipline.drift-detect.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — drift detect (0186)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0186'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0186'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0186

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0186
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0186 -CheckMarker

## completion_marker
PHASE 0186 COMPLETE
