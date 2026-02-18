# BE: Data moat — confidence scoring (0865)

## objective
Implement and verify backend hardening for Data moat: confidence scoring with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0865.md
- .\docs\backend\phases\0865-Data-moat-confidence-scoring.md
- .\supabase\migrations\20260218_0865_Data_moat_confidence_scoring.sql
- .\__tests__\backend\0865.Data-moat.confidence-scoring.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — confidence scoring (0865)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0865'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0865'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0865

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0865
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0865 -CheckMarker

## completion_marker
PHASE 0865 COMPLETE
