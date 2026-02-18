# BE: Schema invariants — check constraints (0598)

## objective
Implement and verify backend hardening for Schema invariants: check constraints with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0598.md
- .\docs\backend\phases\0598-Schema-invariants-check-constraints.md
- .\supabase\migrations\20260218_0598_Schema_invariants_check_constraints.sql
- .\__tests__\backend\0598.Schema-invariants.check-constraints.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — check constraints (0598)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0598'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0598'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0598

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0598
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0598 -CheckMarker

## completion_marker
PHASE 0598 COMPLETE
