# FE: Keyboard avoidance standard — Unit tests

## objective
Add deterministic unit tests covering Keyboard avoidance standard behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0045.md
- .\__tests__\frontend\Keyboard-avoidance-standard.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Keyboard avoidance standard — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0045'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0045'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0045

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0045
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0045 -CheckMarker

## completion_marker
PHASE 0045 COMPLETE
