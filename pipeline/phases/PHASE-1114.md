# BE: Query performance — index coverage (1114)

## objective
Implement and verify backend hardening for Query performance: index coverage with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1114.md
- .\docs\backend\phases\1114-Query-performance-index-coverage.md
- .\supabase\migrations\20260218_1114_Query_performance_index_coverage.sql
- .\__tests__\backend\1114.Query-performance.index-coverage.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — index coverage (1114)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1114'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1114'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1114

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1114
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1114 -CheckMarker

## completion_marker
PHASE 1114 COMPLETE
