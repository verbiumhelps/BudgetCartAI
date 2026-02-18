# FE: Empty/Loading/Error pattern (wired) — Performance

## objective
Define measurable performance expectations for Empty/Loading/Error pattern (wired).

## files_created_or_modified
- .\pipeline\phases\PHASE-0065.md
- .\docs\frontend\perf\EmptyLoadingError-pattern-wired.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Empty/Loading/Error pattern (wired) — Performance'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0065'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0065'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0065

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0065
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0065 -CheckMarker

## completion_marker
PHASE 0065 COMPLETE
