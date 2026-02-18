# FE: Bottom sheet primitive — Unit tests

## objective
Add deterministic unit tests covering Bottom sheet primitive behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0075.md
- .\__tests__\frontend\Bottom-sheet-primitive.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Bottom sheet primitive — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0075'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0075'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0075

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0075
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0075 -CheckMarker

## completion_marker
PHASE 0075 COMPLETE
