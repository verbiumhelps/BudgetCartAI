# BE: Monetization enforcement — metering (1118)

## objective
Implement and verify backend hardening for Monetization enforcement: metering with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1118.md
- .\docs\backend\phases\1118-Monetization-enforcement-metering.md
- .\supabase\migrations\20260218_1118_Monetization_enforcement_metering.sql
- .\__tests__\backend\1118.Monetization-enforcement.metering.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — metering (1118)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1118'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1118'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1118

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1118
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1118 -CheckMarker

## completion_marker
PHASE 1118 COMPLETE
