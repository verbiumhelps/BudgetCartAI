# FE: Skeleton primitives — Contract

## objective
Create a deterministic contract for: Skeleton primitives.

## files_created_or_modified
- .\pipeline\phases\PHASE-0091.md
- .\docs\frontend\contracts\Skeleton-primitives.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Skeleton primitives — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0091'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0091'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0091

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0091
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0091 -CheckMarker

## completion_marker
PHASE 0091 COMPLETE
