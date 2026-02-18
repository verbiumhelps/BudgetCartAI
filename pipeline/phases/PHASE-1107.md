# BE: Testing maturity — unit coverage gates (1107)

## objective
Implement and verify backend hardening for Testing maturity: unit coverage gates with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1107.md
- .\docs\backend\phases\1107-Testing-maturity-unit-coverage-gates.md
- .\supabase\migrations\20260218_1107_Testing_maturity_unit_coverage_gates.sql
- .\__tests__\backend\1107.Testing-maturity.unit-coverage-gates.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — unit coverage gates (1107)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1107'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1107'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1107

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1107
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1107 -CheckMarker

## completion_marker
PHASE 1107 COMPLETE
