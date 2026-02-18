# FE: Spacing + layout primitives — Accessibility

## objective
Ensure Spacing + layout primitives meets a11y requirements with explicit checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0022.md
- .\docs\frontend\a11y\Spacing--layout-primitives.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Spacing + layout primitives — Accessibility'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0022'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0022'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0022

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0022
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0022 -CheckMarker

## completion_marker
PHASE 0022 COMPLETE
