# BE: Data moat — canonicalization (1108)

## objective
Implement and verify backend hardening for Data moat: canonicalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1108.md
- .\docs\backend\phases\1108-Data-moat-canonicalization.md
- .\supabase\migrations\20260218_1108_Data_moat_canonicalization.sql
- .\__tests__\backend\1108.Data-moat.canonicalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — canonicalization (1108)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1108'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1108'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1108

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1108
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1108 -CheckMarker

## completion_marker
PHASE 1108 COMPLETE
