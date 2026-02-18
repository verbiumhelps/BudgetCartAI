# FE: Performance budgets (frontend) — Contract

## objective
Create a deterministic contract for: Performance budgets (frontend).

## files_created_or_modified
- .\pipeline\phases\PHASE-0115.md
- .\docs\frontend\contracts\Performance-budgets-frontend.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Performance budgets (frontend) — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0115'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0115'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0115

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0115
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0115 -CheckMarker

## completion_marker
PHASE 0115 COMPLETE
