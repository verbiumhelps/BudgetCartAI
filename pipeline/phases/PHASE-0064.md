# FE: Empty/Loading/Error pattern (wired) — Accessibility

## objective
Ensure Empty/Loading/Error pattern (wired) meets a11y requirements with explicit checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0064.md
- .\docs\frontend\a11y\EmptyLoadingError-pattern-wired.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Empty/Loading/Error pattern (wired) — Accessibility'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0064'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0064'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0064

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0064
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0064 -CheckMarker

## completion_marker
PHASE 0064 COMPLETE
