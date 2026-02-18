# BE: RLS deny-by-default — cross-household fuzz (0995)

## objective
Implement and verify backend hardening for RLS deny-by-default: cross-household fuzz with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0995.md
- .\docs\backend\phases\0995-RLS-deny-by-default-cross-household-fuzz.md
- .\supabase\migrations\20260218_0995_RLS_deny-by-default_cross-household_fuzz.sql
- .\__tests__\backend\0995.RLS-deny-by-default.cross-household-fuzz.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — cross-household fuzz (0995)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0995'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0995'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0995

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0995
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0995 -CheckMarker

## completion_marker
PHASE 0995 COMPLETE
