# BE: Query performance — cache rules (0565)

## objective
Implement and verify backend hardening for Query performance: cache rules with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0565.md
- .\docs\backend\phases\0565-Query-performance-cache-rules.md
- .\supabase\migrations\20260218_0565_Query_performance_cache_rules.sql
- .\__tests__\backend\0565.Query-performance.cache-rules.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — cache rules (0565)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0565'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0565'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0565

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0565
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0565 -CheckMarker

## completion_marker
PHASE 0565 COMPLETE
