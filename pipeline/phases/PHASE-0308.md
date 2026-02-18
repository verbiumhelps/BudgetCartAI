# BE: Monetization enforcement — metering (0308)

## objective
Implement and verify backend hardening for Monetization enforcement: metering with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0308.md
- .\docs\backend\phases\0308-Monetization-enforcement-metering.md
- .\supabase\migrations\20260218_0308_Monetization_enforcement_metering.sql
- .\__tests__\backend\0308.Monetization-enforcement.metering.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — metering (0308)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0308'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0308'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0308

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0308
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0308 -CheckMarker

## completion_marker
PHASE 0308 COMPLETE
