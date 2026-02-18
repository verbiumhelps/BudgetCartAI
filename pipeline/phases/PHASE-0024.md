# FE: Spacing + layout primitives — Validation hook

## objective
Add deterministic validation script for Spacing + layout primitives outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0024.md
- .\scripts\frontend\validate-Spacing--layout-primitives.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Spacing + layout primitives — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0024'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0024'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0024

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0024
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0024 -CheckMarker

## completion_marker
PHASE 0024 COMPLETE
