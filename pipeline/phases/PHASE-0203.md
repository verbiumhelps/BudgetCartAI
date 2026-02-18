# BE: RLS deny-by-default — rpc security (0203)

## objective
Implement and verify backend hardening for RLS deny-by-default: rpc security with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0203.md
- .\docs\backend\phases\0203-RLS-deny-by-default-rpc-security.md
- .\supabase\migrations\20260218_0203_RLS_deny-by-default_rpc_security.sql
- .\__tests__\backend\0203.RLS-deny-by-default.rpc-security.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: RLS deny-by-default — rpc security (0203)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0203'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0203'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0203

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0203
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0203 -CheckMarker

## completion_marker
PHASE 0203 COMPLETE
