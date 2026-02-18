# BE: RLS deny-by-default — cross-household fuzz (0410)

## objective
Implement and verify backend hardening for RLS deny-by-default: cross-household fuzz with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0410.md
- .\docs\backend\phases\0410-RLS-deny-by-default-cross-household-fuzz.md
- .\supabase\migrations\20260218_0410_RLS_deny-by-default_cross-household_fuzz.sql
- .\__tests__\backend\0410.RLS-deny-by-default.cross-household-fuzz.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — cross-household fuzz (0410)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0410'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0410'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0410

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0410
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0410 -CheckMarker

## completion_marker
PHASE 0410 COMPLETE
