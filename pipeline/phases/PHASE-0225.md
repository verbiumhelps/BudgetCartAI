# BE: Testing maturity — RLS negative suite (0225)

## objective
Implement and verify backend hardening for Testing maturity: RLS negative suite with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0225.md
- .\docs\backend\phases\0225-Testing-maturity-RLS-negative-suite.md
- .\supabase\migrations\20260218_0225_Testing_maturity_RLS_negative_suite.sql
- .\__tests__\backend\0225.Testing-maturity.RLS-negative-suite.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — RLS negative suite (0225)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0225'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0225'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0225

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0225
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0225 -CheckMarker

## completion_marker
PHASE 0225 COMPLETE
