# BE: Schema invariants — constraints (0337)

## objective
Implement and verify backend hardening for Schema invariants: constraints with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0337.md
- .\docs\backend\phases\0337-Schema-invariants-constraints.md
- .\supabase\migrations\20260218_0337_Schema_invariants_constraints.sql
- .\__tests__\backend\0337.Schema-invariants.constraints.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — constraints (0337)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0337'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0337'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0337

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0337
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0337 -CheckMarker

## completion_marker
PHASE 0337 COMPLETE
