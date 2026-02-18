# BE: Data moat — canonicalization (0568)

## objective
Implement and verify backend hardening for Data moat: canonicalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0568.md
- .\docs\backend\phases\0568-Data-moat-canonicalization.md
- .\supabase\migrations\20260218_0568_Data_moat_canonicalization.sql
- .\__tests__\backend\0568.Data-moat.canonicalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — canonicalization (0568)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0568'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0568'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0568

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0568
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0568 -CheckMarker

## completion_marker
PHASE 0568 COMPLETE
