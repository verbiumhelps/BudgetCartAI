# BE: RLS deny-by-default — policy matrix (0527)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy matrix with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0527.md
- .\docs\backend\phases\0527-RLS-deny-by-default-policy-matrix.md
- .\supabase\migrations\20260218_0527_RLS_deny-by-default_policy_matrix.sql
- .\__tests__\backend\0527.RLS-deny-by-default.policy-matrix.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy matrix (0527)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0527'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0527'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0527

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0527
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0527 -CheckMarker

## completion_marker
PHASE 0527 COMPLETE
