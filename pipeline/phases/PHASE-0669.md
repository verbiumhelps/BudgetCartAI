# BE: Security/compliance — export correctness (0669)

## objective
Implement and verify backend hardening for Security/compliance: export correctness with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0669.md
- .\docs\backend\phases\0669-Security/compliance-export-correctness.md
- .\supabase\migrations\20260218_0669_Security/compliance_export_correctness.sql
- .\__tests__\backend\0669.Security/compliance.export-correctness.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Security/compliance — export correctness (0669)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0669'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0669'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0669

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0669
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0669 -CheckMarker

## completion_marker
PHASE 0669 COMPLETE
