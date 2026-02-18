# BE: Monetization enforcement — metering (0713)

## objective
Implement and verify backend hardening for Monetization enforcement: metering with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0713.md
- .\docs\backend\phases\0713-Monetization-enforcement-metering.md
- .\supabase\migrations\20260218_0713_Monetization_enforcement_metering.sql
- .\__tests__\backend\0713.Monetization-enforcement.metering.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — metering (0713)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0713'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0713'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0713

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0713
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0713 -CheckMarker

## completion_marker
PHASE 0713 COMPLETE
