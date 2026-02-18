# QA: Regression ring gate

## objective
Enforce regression suite execution in CI with hard failure.

## files_created_or_modified
- .\pipeline\phases\PHASE-1138.md
- .\scripts\ci\run-regression.ps1
- .\docs\qa\regression-gates.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# QA: Regression ring gate'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1138'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1138'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1138

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1138
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1138 -CheckMarker

## completion_marker
PHASE 1138 COMPLETE
