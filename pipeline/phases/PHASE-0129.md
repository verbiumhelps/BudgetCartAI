# BE: Security/compliance — export correctness (0129)

## objective
Implement and verify backend hardening for Security/compliance: export correctness with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0129.md
- .\docs\backend\phases\0129-Security/compliance-export-correctness.md
- .\supabase\migrations\20260218_0129_Security/compliance_export_correctness.sql
- .\__tests__\backend\0129.Security/compliance.export-correctness.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — export correctness (0129)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0129'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0129'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0129

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0129
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0129 -CheckMarker

## completion_marker
PHASE 0129 COMPLETE
