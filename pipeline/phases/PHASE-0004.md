# FE: Design tokens lock — Accessibility

## objective
Ensure Design tokens lock meets a11y requirements with explicit checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0004.md
- .\docs\frontend\a11y\Design-tokens-lock.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Design tokens lock — Accessibility'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0004'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0004'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0004

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0004
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0004 -CheckMarker

## completion_marker
PHASE 0004 COMPLETE
