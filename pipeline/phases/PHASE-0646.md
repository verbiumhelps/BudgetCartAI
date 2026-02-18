# BE: Query performance — pagination enforcement (0646)

## objective
Implement and verify backend hardening for Query performance: pagination enforcement with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0646.md
- .\docs\backend\phases\0646-Query-performance-pagination-enforcement.md
- .\supabase\migrations\20260218_0646_Query_performance_pagination_enforcement.sql
- .\__tests__\backend\0646.Query-performance.pagination-enforcement.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — pagination enforcement (0646)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0646'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0646'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0646

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0646
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0646 -CheckMarker

## completion_marker
PHASE 0646 COMPLETE
