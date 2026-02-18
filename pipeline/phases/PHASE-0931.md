# BE: Schema invariants — constraints (0931)

## objective
Implement and verify backend hardening for Schema invariants: constraints with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0931.md
- .\docs\backend\phases\0931-Schema-invariants-constraints.md
- .\supabase\migrations\20260218_0931_Schema_invariants_constraints.sql
- .\__tests__\backend\0931.Schema-invariants.constraints.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — constraints (0931)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0931'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0931'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0931

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0931
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0931 -CheckMarker

## completion_marker
PHASE 0931 COMPLETE
