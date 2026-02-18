# FE: Navigation conventions — Implementation

## objective
Document and enforce route naming + deep link mapping.

## files_created_or_modified
- .\pipeline\phases\PHASE-0098.md
- .\docs\frontend\navigation-conventions.md
- .\scripts\validate-routes.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Navigation conventions — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0098'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0098'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0098

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0098
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0098 -CheckMarker

## completion_marker
PHASE 0098 COMPLETE
