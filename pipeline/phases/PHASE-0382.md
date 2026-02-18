# BE: Schema invariants — check constraints (0382)

## objective
Implement and verify backend hardening for Schema invariants: check constraints with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0382.md
- .\docs\backend\phases\0382-Schema-invariants-check-constraints.md
- .\supabase\migrations\20260218_0382_Schema_invariants_check_constraints.sql
- .\__tests__\backend\0382.Schema-invariants.check-constraints.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — check constraints (0382)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0382'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0382'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0382

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0382
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0382 -CheckMarker

## completion_marker
PHASE 0382 COMPLETE
