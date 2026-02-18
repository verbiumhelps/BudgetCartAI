# BE: RLS deny-by-default — policy matrix (0572)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy matrix with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0572.md
- .\docs\backend\phases\0572-RLS-deny-by-default-policy-matrix.md
- .\supabase\migrations\20260218_0572_RLS_deny-by-default_policy_matrix.sql
- .\__tests__\backend\0572.RLS-deny-by-default.policy-matrix.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy matrix (0572)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0572'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0572'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0572

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0572
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0572 -CheckMarker

## completion_marker
PHASE 0572 COMPLETE
