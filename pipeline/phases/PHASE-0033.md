# FE: Input primitive — Unit tests

## objective
Add deterministic unit tests covering Input primitive behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0033.md
- .\__tests__\frontend\Input-primitive.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Input primitive — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0033'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0033'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0033

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0033
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0033 -CheckMarker

## completion_marker
PHASE 0033 COMPLETE
