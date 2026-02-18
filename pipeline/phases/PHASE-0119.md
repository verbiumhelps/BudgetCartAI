# FE: Performance budgets (frontend) — Performance

## objective
Define measurable performance expectations for Performance budgets (frontend).

## files_created_or_modified
- .\pipeline\phases\PHASE-0119.md
- .\docs\frontend\perf\Performance-budgets-frontend.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Performance budgets (frontend) — Performance'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0119'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0119'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0119

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0119
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0119 -CheckMarker

## completion_marker
PHASE 0119 COMPLETE
