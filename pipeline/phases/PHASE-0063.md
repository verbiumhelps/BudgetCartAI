# FE: Empty/Loading/Error pattern (wired) — Unit tests

## objective
Add deterministic unit tests covering Empty/Loading/Error pattern (wired) behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0063.md
- .\__tests__\frontend\EmptyLoadingError-pattern-wired.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Empty/Loading/Error pattern (wired) — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0063'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0063'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0063

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0063
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0063 -CheckMarker

## completion_marker
PHASE 0063 COMPLETE
