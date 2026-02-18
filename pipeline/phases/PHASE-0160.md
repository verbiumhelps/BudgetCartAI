# BE: Query performance — cache rules (0160)

## objective
Implement and verify backend hardening for Query performance: cache rules with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0160.md
- .\docs\backend\phases\0160-Query-performance-cache-rules.md
- .\supabase\migrations\20260218_0160_Query_performance_cache_rules.sql
- .\__tests__\backend\0160.Query-performance.cache-rules.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Query performance — cache rules (0160)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0160'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0160'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0160

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0160
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0160 -CheckMarker

## completion_marker
PHASE 0160 COMPLETE
