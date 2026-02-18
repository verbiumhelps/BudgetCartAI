# FE: Empty/Loading/Error pattern (wired) — Validation hook

## objective
Add deterministic validation script for Empty/Loading/Error pattern (wired) outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0066.md
- .\scripts\frontend\validate-EmptyLoadingError-pattern-wired.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Empty/Loading/Error pattern (wired) — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0066'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0066'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0066

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0066
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0066 -CheckMarker

## completion_marker
PHASE 0066 COMPLETE
