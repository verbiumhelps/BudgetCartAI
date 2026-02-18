# FE: Navigation conventions — Contract

## objective
Create a deterministic contract for: Navigation conventions.

## files_created_or_modified
- .\pipeline\phases\PHASE-0097.md
- .\docs\frontend\contracts\Navigation-conventions.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Navigation conventions — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0097'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0097'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0097

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0097
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0097 -CheckMarker

## completion_marker
PHASE 0097 COMPLETE
