# FE: Typography system — Unit tests

## objective
Add deterministic unit tests covering Typography system behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0009.md
- .\__tests__\frontend\Typography-system.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Typography system — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0009'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0009'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0009

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0009
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0009 -CheckMarker

## completion_marker
PHASE 0009 COMPLETE
