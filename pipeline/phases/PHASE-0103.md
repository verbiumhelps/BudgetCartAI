# FE: Error taxonomy (frontend) — Contract

## objective
Create a deterministic contract for: Error taxonomy (frontend).

## files_created_or_modified
- .\pipeline\phases\PHASE-0103.md
- .\docs\frontend\contracts\Error-taxonomy-frontend.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Error taxonomy (frontend) — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0103'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0103'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0103

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0103
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0103 -CheckMarker

## completion_marker
PHASE 0103 COMPLETE
