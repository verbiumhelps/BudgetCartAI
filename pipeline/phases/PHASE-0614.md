# BE: Monetization enforcement — entitlements (0614)

## objective
Implement and verify backend hardening for Monetization enforcement: entitlements with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0614.md
- .\docs\backend\phases\0614-Monetization-enforcement-entitlements.md
- .\supabase\migrations\20260218_0614_Monetization_enforcement_entitlements.sql
- .\__tests__\backend\0614.Monetization-enforcement.entitlements.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — entitlements (0614)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0614'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0614'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0614

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0614
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0614 -CheckMarker

## completion_marker
PHASE 0614 COMPLETE
