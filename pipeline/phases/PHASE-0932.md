# BE: RLS deny-by-default — policy matrix (0932)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy matrix with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0932.md
- .\docs\backend\phases\0932-RLS-deny-by-default-policy-matrix.md
- .\supabase\migrations\20260218_0932_RLS_deny-by-default_policy_matrix.sql
- .\__tests__\backend\0932.RLS-deny-by-default.policy-matrix.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy matrix (0932)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0932'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0932'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0932

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0932
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0932 -CheckMarker

## completion_marker
PHASE 0932 COMPLETE
