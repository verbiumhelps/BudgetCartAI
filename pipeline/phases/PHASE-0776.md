# BE: Monetization enforcement — receipt validation (0776)

## objective
Implement and verify backend hardening for Monetization enforcement: receipt validation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0776.md
- .\docs\backend\phases\0776-Monetization-enforcement-receipt-validation.md
- .\supabase\migrations\20260218_0776_Monetization_enforcement_receipt_validation.sql
- .\__tests__\backend\0776.Monetization-enforcement.receipt-validation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — receipt validation (0776)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0776'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0776'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0776

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0776
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0776 -CheckMarker

## completion_marker
PHASE 0776 COMPLETE
