# BE: Data moat — graph metrics (0559)

## objective
Implement and verify backend hardening for Data moat: graph metrics with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0559.md
- .\docs\backend\phases\0559-Data-moat-graph-metrics.md
- .\supabase\migrations\20260218_0559_Data_moat_graph_metrics.sql
- .\__tests__\backend\0559.Data-moat.graph-metrics.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — graph metrics (0559)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0559'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0559'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0559

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0559
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0559 -CheckMarker

## completion_marker
PHASE 0559 COMPLETE
