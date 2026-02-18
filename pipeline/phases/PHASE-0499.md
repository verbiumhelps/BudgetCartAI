# BE: Schema invariants — constraints (0499)

## objective
Implement and verify backend hardening for Schema invariants: constraints with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0499.md
- .\docs\backend\phases\0499-Schema-invariants-constraints.md
- .\supabase\migrations\20260218_0499_Schema_invariants_constraints.sql
- .\__tests__\backend\0499.Schema-invariants.constraints.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — constraints (0499)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0499'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0499'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0499

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0499
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0499 -CheckMarker

## completion_marker
PHASE 0499 COMPLETE
