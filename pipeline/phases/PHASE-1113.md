# BE: Migrations discipline — idempotency (1113)

## objective
Implement and verify backend hardening for Migrations discipline: idempotency with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1113.md
- .\docs\backend\phases\1113-Migrations-discipline-idempotency.md
- .\supabase\migrations\20260218_1113_Migrations_discipline_idempotency.sql
- .\__tests__\backend\1113.Migrations-discipline.idempotency.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — idempotency (1113)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1113'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1113'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1113

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1113
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1113 -CheckMarker

## completion_marker
PHASE 1113 COMPLETE
