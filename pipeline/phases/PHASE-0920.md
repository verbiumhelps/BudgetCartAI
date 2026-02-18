# BE: Monetization enforcement — upgrade triggers (0920)

## objective
Implement and verify backend hardening for Monetization enforcement: upgrade triggers with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0920.md
- .\docs\backend\phases\0920-Monetization-enforcement-upgrade-triggers.md
- .\supabase\migrations\20260218_0920_Monetization_enforcement_upgrade_triggers.sql
- .\__tests__\backend\0920.Monetization-enforcement.upgrade-triggers.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — upgrade triggers (0920)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0920'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0920'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0920

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0920
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0920 -CheckMarker

## completion_marker
PHASE 0920 COMPLETE
