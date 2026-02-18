# FE: Keyboard avoidance standard — Accessibility

## objective
Ensure Keyboard avoidance standard meets a11y requirements with explicit checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0046.md
- .\docs\frontend\a11y\Keyboard-avoidance-standard.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Keyboard avoidance standard — Accessibility'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0046'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0046'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0046

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0046
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0046 -CheckMarker

## completion_marker
PHASE 0046 COMPLETE
