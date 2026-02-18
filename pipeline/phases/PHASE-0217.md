# BE: Data moat — alias clustering (0217)

## objective
Implement and verify backend hardening for Data moat: alias clustering with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0217.md
- .\docs\backend\phases\0217-Data-moat-alias-clustering.md
- .\supabase\migrations\20260218_0217_Data_moat_alias_clustering.sql
- .\__tests__\backend\0217.Data-moat.alias-clustering.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — alias clustering (0217)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0217'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0217'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0217

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0217
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0217 -CheckMarker

## completion_marker
PHASE 0217 COMPLETE
