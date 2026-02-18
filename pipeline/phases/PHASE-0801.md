# BE: Testing maturity — integration harness (0801)

## objective
Implement and verify backend hardening for Testing maturity: integration harness with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0801.md
- .\docs\backend\phases\0801-Testing-maturity-integration-harness.md
- .\supabase\migrations\20260218_0801_Testing_maturity_integration_harness.sql
- .\__tests__\backend\0801.Testing-maturity.integration-harness.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — integration harness (0801)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0801'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0801'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0801

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0801
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0801 -CheckMarker

## completion_marker
PHASE 0801 COMPLETE
