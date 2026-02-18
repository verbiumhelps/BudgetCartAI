# BE: RLS deny-by-default — policy tests (0401)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy tests with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0401.md
- .\docs\backend\phases\0401-RLS-deny-by-default-policy-tests.md
- .\supabase\migrations\20260218_0401_RLS_deny-by-default_policy_tests.sql
- .\__tests__\backend\0401.RLS-deny-by-default.policy-tests.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy tests (0401)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0401'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0401'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0401

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0401
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0401 -CheckMarker

## completion_marker
PHASE 0401 COMPLETE
