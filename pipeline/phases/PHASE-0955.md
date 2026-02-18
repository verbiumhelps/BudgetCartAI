# BE: Data moat — confidence scoring (0955)

## objective
Implement and verify backend hardening for Data moat: confidence scoring with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0955.md
- .\docs\backend\phases\0955-Data-moat-confidence-scoring.md
- .\supabase\migrations\20260218_0955_Data_moat_confidence_scoring.sql
- .\__tests__\backend\0955.Data-moat.confidence-scoring.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — confidence scoring (0955)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0955'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0955'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0955

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0955
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0955 -CheckMarker

## completion_marker
PHASE 0955 COMPLETE
