# FE: Performance budgets (frontend) — Unit tests

## objective
Add deterministic unit tests covering Performance budgets (frontend) behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0117.md
- .\__tests__\frontend\Performance-budgets-frontend.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Performance budgets (frontend) — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0117'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0117'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0117

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0117
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0117 -CheckMarker

## completion_marker
PHASE 0117 COMPLETE
