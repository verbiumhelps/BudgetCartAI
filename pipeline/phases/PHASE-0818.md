# BE: Observability — error taxonomy (0818)

## objective
Implement and verify backend hardening for Observability: error taxonomy with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0818.md
- .\docs\backend\phases\0818-Observability-error-taxonomy.md
- .\supabase\migrations\20260218_0818_Observability_error_taxonomy.sql
- .\__tests__\backend\0818.Observability.error-taxonomy.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — error taxonomy (0818)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0818'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0818'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0818

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0818
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0818 -CheckMarker

## completion_marker
PHASE 0818 COMPLETE
