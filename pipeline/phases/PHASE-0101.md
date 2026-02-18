# FE: Navigation conventions — Performance

## objective
Define measurable performance expectations for Navigation conventions.

## files_created_or_modified
- .\pipeline\phases\PHASE-0101.md
- .\docs\frontend\perf\Navigation-conventions.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Navigation conventions — Performance'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0101'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0101'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0101

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0101
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0101 -CheckMarker

## completion_marker
PHASE 0101 COMPLETE
