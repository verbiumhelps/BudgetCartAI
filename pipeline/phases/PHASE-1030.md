# BE: Schema invariants — check constraints (1030)

## objective
Implement and verify backend hardening for Schema invariants: check constraints with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1030.md
- .\docs\backend\phases\1030-Schema-invariants-check-constraints.md
- .\supabase\migrations\20260218_1030_Schema_invariants_check_constraints.sql
- .\__tests__\backend\1030.Schema-invariants.check-constraints.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — check constraints (1030)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1030'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1030'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1030

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1030
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1030 -CheckMarker

## completion_marker
PHASE 1030 COMPLETE
