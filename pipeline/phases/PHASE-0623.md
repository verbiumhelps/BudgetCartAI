# BE: Monetization enforcement — metering (0623)

## objective
Implement and verify backend hardening for Monetization enforcement: metering with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0623.md
- .\docs\backend\phases\0623-Monetization-enforcement-metering.md
- .\supabase\migrations\20260218_0623_Monetization_enforcement_metering.sql
- .\__tests__\backend\0623.Monetization-enforcement.metering.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — metering (0623)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0623'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0623'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0623

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0623
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0623 -CheckMarker

## completion_marker
PHASE 0623 COMPLETE
