# BE: Testing maturity — load testing (0738)

## objective
Implement and verify backend hardening for Testing maturity: load testing with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0738.md
- .\docs\backend\phases\0738-Testing-maturity-load-testing.md
- .\supabase\migrations\20260218_0738_Testing_maturity_load_testing.sql
- .\__tests__\backend\0738.Testing-maturity.load-testing.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Testing maturity — load testing (0738)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0738'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0738'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0738

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0738
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0738 -CheckMarker

## completion_marker
PHASE 0738 COMPLETE
