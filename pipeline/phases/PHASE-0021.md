# FE: Spacing + layout primitives — Unit tests

## objective
Add deterministic unit tests covering Spacing + layout primitives behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0021.md
- .\__tests__\frontend\Spacing--layout-primitives.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Spacing + layout primitives — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0021'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0021'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0021

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0021
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0021 -CheckMarker

## completion_marker
PHASE 0021 COMPLETE
