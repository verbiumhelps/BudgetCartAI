# FE: ListRow primitive — Performance

## objective
Define measurable performance expectations for ListRow primitive.

## files_created_or_modified
- .\pipeline\phases\PHASE-0083.md
- .\docs\frontend\perf\ListRow-primitive.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: ListRow primitive — Performance'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0083'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0083'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0083

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0083
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0083 -CheckMarker

## completion_marker
PHASE 0083 COMPLETE
