# BE: RLS deny-by-default — policy tests (0851)

## objective
Implement and verify backend hardening for RLS deny-by-default: policy tests with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0851.md
- .\docs\backend\phases\0851-RLS-deny-by-default-policy-tests.md
- .\supabase\migrations\20260218_0851_RLS_deny-by-default_policy_tests.sql
- .\__tests__\backend\0851.RLS-deny-by-default.policy-tests.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — policy tests (0851)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0851'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0851'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0851

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0851
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0851 -CheckMarker

## completion_marker
PHASE 0851 COMPLETE
