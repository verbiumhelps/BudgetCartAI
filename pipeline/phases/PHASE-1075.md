# BE: Schema invariants — partial indexes (1075)

## objective
Implement and verify backend hardening for Schema invariants: partial indexes with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1075.md
- .\docs\backend\phases\1075-Schema-invariants-partial-indexes.md
- .\supabase\migrations\20260218_1075_Schema_invariants_partial_indexes.sql
- .\__tests__\backend\1075.Schema-invariants.partial-indexes.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — partial indexes (1075)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1075'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1075'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1075

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1075
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1075 -CheckMarker

## completion_marker
PHASE 1075 COMPLETE
