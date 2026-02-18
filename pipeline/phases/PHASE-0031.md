# FE: Input primitive — Contract

## objective
Create a deterministic contract for: Input primitive.

## files_created_or_modified
- .\pipeline\phases\PHASE-0031.md
- .\docs\frontend\contracts\Input-primitive.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Input primitive — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0031'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0031'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0031

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0031
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0031 -CheckMarker

## completion_marker
PHASE 0031 COMPLETE
