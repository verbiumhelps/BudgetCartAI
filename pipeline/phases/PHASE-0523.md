# BE: Data moat — canonicalization (0523)

## objective
Implement and verify backend hardening for Data moat: canonicalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0523.md
- .\docs\backend\phases\0523-Data-moat-canonicalization.md
- .\supabase\migrations\20260218_0523_Data_moat_canonicalization.sql
- .\__tests__\backend\0523.Data-moat.canonicalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — canonicalization (0523)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0523'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0523'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0523

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0523
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0523 -CheckMarker

## completion_marker
PHASE 0523 COMPLETE
