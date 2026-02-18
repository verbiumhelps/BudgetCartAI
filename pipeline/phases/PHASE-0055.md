# FE: Header pattern — Contract

## objective
Create a deterministic contract for: Header pattern.

## files_created_or_modified
- .\pipeline\phases\PHASE-0055.md
- .\docs\frontend\contracts\Header-pattern.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Header pattern — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0055'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0055'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0055

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0055
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0055 -CheckMarker

## completion_marker
PHASE 0055 COMPLETE
