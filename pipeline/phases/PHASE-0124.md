# BE: Query performance — index coverage (0124)

## objective
Implement and verify backend hardening for Query performance: index coverage with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0124.md
- .\docs\backend\phases\0124-Query-performance-index-coverage.md
- .\supabase\migrations\20260218_0124_Query_performance_index_coverage.sql
- .\__tests__\backend\0124.Query-performance.index-coverage.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — index coverage (0124)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0124'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0124'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0124

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0124
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0124 -CheckMarker

## completion_marker
PHASE 0124 COMPLETE
