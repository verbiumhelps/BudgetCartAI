# BE: RLS deny-by-default — policy tests (1076)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy tests with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1076.md
- .\docs\backend\phases\1076-RLS-deny-by-default-policy-tests.md
- .\supabase\migrations\20260218_1076_RLS_deny-by-default_policy_tests.sql
- .\__tests__\backend\1076.RLS-deny-by-default.policy-tests.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy tests (1076)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1076'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1076'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1076

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1076
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1076 -CheckMarker

## completion_marker
PHASE 1076 COMPLETE
