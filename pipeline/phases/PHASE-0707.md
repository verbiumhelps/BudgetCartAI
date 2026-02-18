# BE: RLS deny-by-default — policy matrix (0707)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy matrix with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0707.md
- .\docs\backend\phases\0707-RLS-deny-by-default-policy-matrix.md
- .\supabase\migrations\20260218_0707_RLS_deny-by-default_policy_matrix.sql
- .\__tests__\backend\0707.RLS-deny-by-default.policy-matrix.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy matrix (0707)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0707'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0707'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0707

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0707
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0707 -CheckMarker

## completion_marker
PHASE 0707 COMPLETE
