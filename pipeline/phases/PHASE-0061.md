# FE: Empty/Loading/Error pattern (wired) — Contract

## objective
Create a deterministic contract for: Empty/Loading/Error pattern (wired).

## files_created_or_modified
- .\pipeline\phases\PHASE-0061.md
- .\docs\frontend\contracts\EmptyLoadingError-pattern-wired.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Empty/Loading/Error pattern (wired) — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0061'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0061'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0061

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0061
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0061 -CheckMarker

## completion_marker
PHASE 0061 COMPLETE
