# BE: Data moat — graph metrics (0289)

## objective
Implement and verify backend hardening for Data moat: graph metrics with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0289.md
- .\docs\backend\phases\0289-Data-moat-graph-metrics.md
- .\supabase\migrations\20260218_0289_Data_moat_graph_metrics.sql
- .\__tests__\backend\0289.Data-moat.graph-metrics.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — graph metrics (0289)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0289'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0289'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0289

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0289
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0289 -CheckMarker

## completion_marker
PHASE 0289 COMPLETE
