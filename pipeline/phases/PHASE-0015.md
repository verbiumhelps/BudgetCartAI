# FE: Color + contrast audit harness — Unit tests

## objective
Add deterministic unit tests covering Color + contrast audit harness behaviors.

## files_created_or_modified
- .\pipeline\phases\PHASE-0015.md
- .\__tests__\frontend\Color--contrast-audit-harness.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Color + contrast audit harness — Unit tests'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0015'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0015'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0015

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0015
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0015 -CheckMarker

## completion_marker
PHASE 0015 COMPLETE
