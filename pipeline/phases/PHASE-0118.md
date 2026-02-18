# FE: Performance budgets (frontend) — Accessibility

## objective
Ensure Performance budgets (frontend) meets a11y requirements with explicit checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0118.md
- .\docs\frontend\a11y\Performance-budgets-frontend.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Performance budgets (frontend) — Accessibility'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0118'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0118'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0118

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0118
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0118 -CheckMarker

## completion_marker
PHASE 0118 COMPLETE
