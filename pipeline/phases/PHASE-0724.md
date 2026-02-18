# BE: Schema invariants — enums (0724)

## objective
Implement and verify backend hardening for Schema invariants: enums with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0724.md
- .\docs\backend\phases\0724-Schema-invariants-enums.md
- .\supabase\migrations\20260218_0724_Schema_invariants_enums.sql
- .\__tests__\backend\0724.Schema-invariants.enums.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Schema invariants — enums (0724)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0724'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0724'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0724

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0724
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0724 -CheckMarker

## completion_marker
PHASE 0724 COMPLETE
