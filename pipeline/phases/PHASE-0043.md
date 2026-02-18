# FE: Keyboard avoidance standard — Contract

## objective
Create a deterministic contract for: Keyboard avoidance standard.

## files_created_or_modified
- .\pipeline\phases\PHASE-0043.md
- .\docs\frontend\contracts\Keyboard-avoidance-standard.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Keyboard avoidance standard — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0043'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0043'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0043

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0043
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0043 -CheckMarker

## completion_marker
PHASE 0043 COMPLETE
