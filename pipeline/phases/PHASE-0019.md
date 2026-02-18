# FE: Spacing + layout primitives — Contract

## objective
Create a deterministic contract for: Spacing + layout primitives.

## files_created_or_modified
- .\pipeline\phases\PHASE-0019.md
- .\docs\frontend\contracts\Spacing--layout-primitives.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Spacing + layout primitives — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0019'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0019'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0019

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0019
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0019 -CheckMarker

## completion_marker
PHASE 0019 COMPLETE
