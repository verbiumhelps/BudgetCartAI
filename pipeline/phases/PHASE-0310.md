# BE: Schema invariants — unique indexes (0310)

## objective
Implement and verify backend hardening for Schema invariants: unique indexes with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0310.md
- .\docs\backend\phases\0310-Schema-invariants-unique-indexes.md
- .\supabase\migrations\20260218_0310_Schema_invariants_unique_indexes.sql
- .\__tests__\backend\0310.Schema-invariants.unique-indexes.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — unique indexes (0310)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0310'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0310'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0310

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0310
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0310 -CheckMarker

## completion_marker
PHASE 0310 COMPLETE
