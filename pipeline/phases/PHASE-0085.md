# FE: Virtualized list wrapper — Contract

## objective
Create a deterministic contract for: Virtualized list wrapper.

## files_created_or_modified
- .\pipeline\phases\PHASE-0085.md
- .\docs\frontend\contracts\Virtualized-list-wrapper.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Virtualized list wrapper — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0085'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0085'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0085

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0085
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0085 -CheckMarker

## completion_marker
PHASE 0085 COMPLETE
