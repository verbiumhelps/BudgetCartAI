# BE: Schema invariants — foreign keys (0463)

## objective
Implement and verify backend hardening for Schema invariants: foreign keys with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0463.md
- .\docs\backend\phases\0463-Schema-invariants-foreign-keys.md
- .\supabase\migrations\20260218_0463_Schema_invariants_foreign_keys.sql
- .\__tests__\backend\0463.Schema-invariants.foreign-keys.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — foreign keys (0463)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0463'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0463'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0463

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0463
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0463 -CheckMarker

## completion_marker
PHASE 0463 COMPLETE
