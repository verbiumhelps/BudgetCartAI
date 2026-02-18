# BE: Data moat — canonicalization (0973)

## objective
Implement and verify backend hardening for Data moat: canonicalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0973.md
- .\docs\backend\phases\0973-Data-moat-canonicalization.md
- .\supabase\migrations\20260218_0973_Data_moat_canonicalization.sql
- .\__tests__\backend\0973.Data-moat.canonicalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — canonicalization (0973)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0973'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0973'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0973

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0973
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0973 -CheckMarker

## completion_marker
PHASE 0973 COMPLETE
