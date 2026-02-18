# FE: ListRow primitive — Contract

## objective
Create a deterministic contract for: ListRow primitive.

## files_created_or_modified
- .\pipeline\phases\PHASE-0079.md
- .\docs\frontend\contracts\ListRow-primitive.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: ListRow primitive — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0079'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0079'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0079

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0079
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0079 -CheckMarker

## completion_marker
PHASE 0079 COMPLETE
