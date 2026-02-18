# BE: RLS deny-by-default — role simulation (0419)

## objective
Implement and verify backend hardening for RLS deny-by-default: role simulation with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0419.md
- .\docs\backend\phases\0419-RLS-deny-by-default-role-simulation.md
- .\supabase\migrations\20260218_0419_RLS_deny-by-default_role_simulation.sql
- .\__tests__\backend\0419.RLS-deny-by-default.role-simulation.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — role simulation (0419)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0419'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0419'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0419

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0419
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0419 -CheckMarker

## completion_marker
PHASE 0419 COMPLETE
