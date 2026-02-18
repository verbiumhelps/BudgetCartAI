# BE: Monetization enforcement — entitlements (0884)

## objective
Implement and verify backend hardening for Monetization enforcement: entitlements with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0884.md
- .\docs\backend\phases\0884-Monetization-enforcement-entitlements.md
- .\supabase\migrations\20260218_0884_Monetization_enforcement_entitlements.sql
- .\__tests__\backend\0884.Monetization-enforcement.entitlements.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — entitlements (0884)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0884'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0884'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0884

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0884
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0884 -CheckMarker

## completion_marker
PHASE 0884 COMPLETE
