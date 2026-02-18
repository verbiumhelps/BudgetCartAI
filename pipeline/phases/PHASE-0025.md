# FE: Button primitive — Contract

## objective
Create a deterministic contract for: Button primitive.

## files_created_or_modified
- .\pipeline\phases\PHASE-0025.md
- .\docs\frontend\contracts\Button-primitive.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Button primitive — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0025'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0025'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0025

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0025
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0025 -CheckMarker

## completion_marker
PHASE 0025 COMPLETE
