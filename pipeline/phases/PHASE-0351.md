# BE: Testing maturity — integration harness (0351)

## objective
Implement and verify backend hardening for Testing maturity: integration harness with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0351.md
- .\docs\backend\phases\0351-Testing-maturity-integration-harness.md
- .\supabase\migrations\20260218_0351_Testing_maturity_integration_harness.sql
- .\__tests__\backend\0351.Testing-maturity.integration-harness.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — integration harness (0351)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0351'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0351'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0351

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0351
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0351 -CheckMarker

## completion_marker
PHASE 0351 COMPLETE
