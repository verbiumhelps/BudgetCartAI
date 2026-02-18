# BE: Migrations discipline — idempotency (0663)

## objective
Implement and verify backend hardening for Migrations discipline: idempotency with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0663.md
- .\docs\backend\phases\0663-Migrations-discipline-idempotency.md
- .\supabase\migrations\20260218_0663_Migrations_discipline_idempotency.sql
- .\__tests__\backend\0663.Migrations-discipline.idempotency.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Migrations discipline — idempotency (0663)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0663'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0663'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0663

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0663
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0663 -CheckMarker

## completion_marker
PHASE 0663 COMPLETE
