# BE: Observability — error taxonomy (0188)

## objective
Implement and verify backend hardening for Observability: error taxonomy with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0188.md
- .\docs\backend\phases\0188-Observability-error-taxonomy.md
- .\supabase\migrations\20260218_0188_Observability_error_taxonomy.sql
- .\__tests__\backend\0188.Observability.error-taxonomy.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Observability — error taxonomy (0188)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0188'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0188'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0188

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0188
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0188 -CheckMarker

## completion_marker
PHASE 0188 COMPLETE
