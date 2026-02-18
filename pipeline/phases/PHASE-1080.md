# BE: Testing maturity — RLS negative suite (1080)

## objective
Implement and verify backend hardening for Testing maturity: RLS negative suite with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1080.md
- .\docs\backend\phases\1080-Testing-maturity-RLS-negative-suite.md
- .\supabase\migrations\20260218_1080_Testing_maturity_RLS_negative_suite.sql
- .\__tests__\backend\1080.Testing-maturity.RLS-negative-suite.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — RLS negative suite (1080)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1080'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1080'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1080

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1080
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1080 -CheckMarker

## completion_marker
PHASE 1080 COMPLETE
