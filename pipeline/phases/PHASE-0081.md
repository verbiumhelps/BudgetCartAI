# FE: ListRow primitive — Unit tests

## objective
Add deterministic unit tests covering ListRow primitive behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0081.md
- .\__tests__\frontend\ListRow-primitive.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: ListRow primitive — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0081'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0081'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0081

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0081
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0081 -CheckMarker

## completion_marker
PHASE 0081 COMPLETE
