# BE: Monetization enforcement — upgrade triggers (0155)

## objective
Implement and verify backend hardening for Monetization enforcement: upgrade triggers with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0155.md
- .\docs\backend\phases\0155-Monetization-enforcement-upgrade-triggers.md
- .\supabase\migrations\20260218_0155_Monetization_enforcement_upgrade_triggers.sql
- .\__tests__\backend\0155.Monetization-enforcement.upgrade-triggers.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — upgrade triggers (0155)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0155'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0155'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0155

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0155
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0155 -CheckMarker

## completion_marker
PHASE 0155 COMPLETE
