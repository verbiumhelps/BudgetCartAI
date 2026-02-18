# BE: Migrations discipline — idempotency (0933)

## objective
Implement and verify backend hardening for Migrations discipline: idempotency with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0933.md
- .\docs\backend\phases\0933-Migrations-discipline-idempotency.md
- .\supabase\migrations\20260218_0933_Migrations_discipline_idempotency.sql
- .\__tests__\backend\0933.Migrations-discipline.idempotency.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — idempotency (0933)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0933'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0933'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0933

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0933
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0933 -CheckMarker

## completion_marker
PHASE 0933 COMPLETE
