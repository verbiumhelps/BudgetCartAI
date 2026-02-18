# FE: Bottom sheet primitive — Contract

## objective
Create a deterministic contract for: Bottom sheet primitive.

## files_created_or_modified
- .\pipeline\phases\PHASE-0073.md
- .\docs\frontend\contracts\Bottom-sheet-primitive.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Bottom sheet primitive — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0073'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0073'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0073

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0073
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0073 -CheckMarker

## completion_marker
PHASE 0073 COMPLETE
