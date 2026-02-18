# BE: Monetization enforcement — entitlements (1109)

## objective
Implement and verify backend hardening for Monetization enforcement: entitlements with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1109.md
- .\docs\backend\phases\1109-Monetization-enforcement-entitlements.md
- .\supabase\migrations\20260218_1109_Monetization_enforcement_entitlements.sql
- .\__tests__\backend\1109.Monetization-enforcement.entitlements.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — entitlements (1109)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1109'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1109'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1109

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1109
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1109 -CheckMarker

## completion_marker
PHASE 1109 COMPLETE
