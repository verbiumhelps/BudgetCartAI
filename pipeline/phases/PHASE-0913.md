# BE: Schema invariants — partial indexes (0913)

## objective
Implement and verify backend hardening for Schema invariants: partial indexes with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0913.md
- .\docs\backend\phases\0913-Schema-invariants-partial-indexes.md
- .\supabase\migrations\20260218_0913_Schema_invariants_partial_indexes.sql
- .\__tests__\backend\0913.Schema-invariants.partial-indexes.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — partial indexes (0913)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0913'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0913'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0913

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0913
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0913 -CheckMarker

## completion_marker
PHASE 0913 COMPLETE
