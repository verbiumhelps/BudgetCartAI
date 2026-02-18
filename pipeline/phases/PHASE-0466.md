# BE: Query performance — pagination enforcement (0466)

## objective
Implement and verify backend hardening for Query performance: pagination enforcement with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0466.md
- .\docs\backend\phases\0466-Query-performance-pagination-enforcement.md
- .\supabase\migrations\20260218_0466_Query_performance_pagination_enforcement.sql
- .\__tests__\backend\0466.Query-performance.pagination-enforcement.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — pagination enforcement (0466)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0466'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0466'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0466

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0466
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0466 -CheckMarker

## completion_marker
PHASE 0466 COMPLETE
