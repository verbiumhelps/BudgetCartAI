# BE: Data moat — confidence scoring (0595)

## objective
Implement and verify backend hardening for Data moat: confidence scoring with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0595.md
- .\docs\backend\phases\0595-Data-moat-confidence-scoring.md
- .\supabase\migrations\20260218_0595_Data_moat_confidence_scoring.sql
- .\__tests__\backend\0595.Data-moat.confidence-scoring.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — confidence scoring (0595)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0595'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0595'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0595

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0595
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0595 -CheckMarker

## completion_marker
PHASE 0595 COMPLETE
