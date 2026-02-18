# BE: Data moat — canonicalization (0613)

## objective
Implement and verify backend hardening for Data moat: canonicalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0613.md
- .\docs\backend\phases\0613-Data-moat-canonicalization.md
- .\supabase\migrations\20260218_0613_Data_moat_canonicalization.sql
- .\__tests__\backend\0613.Data-moat.canonicalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — canonicalization (0613)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0613'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0613'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0613

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0613
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0613 -CheckMarker

## completion_marker
PHASE 0613 COMPLETE
