# BE: Monetization enforcement — receipt validation (0281)

## objective
Implement and verify backend hardening for Monetization enforcement: receipt validation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0281.md
- .\docs\backend\phases\0281-Monetization-enforcement-receipt-validation.md
- .\supabase\migrations\20260218_0281_Monetization_enforcement_receipt_validation.sql
- .\__tests__\backend\0281.Monetization-enforcement.receipt-validation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — receipt validation (0281)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0281'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0281'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0281

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0281
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0281 -CheckMarker

## completion_marker
PHASE 0281 COMPLETE
