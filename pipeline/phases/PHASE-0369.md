# BE: Testing maturity — mutation testing (0369)

## objective
Implement and verify backend hardening for Testing maturity: mutation testing with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0369.md
- .\docs\backend\phases\0369-Testing-maturity-mutation-testing.md
- .\supabase\migrations\20260218_0369_Testing_maturity_mutation_testing.sql
- .\__tests__\backend\0369.Testing-maturity.mutation-testing.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — mutation testing (0369)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0369'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0369'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0369

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0369
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0369 -CheckMarker

## completion_marker
PHASE 0369 COMPLETE
