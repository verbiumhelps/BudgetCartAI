# FE: Virtualized list wrapper — Validation hook

## objective
Add deterministic validation script for Virtualized list wrapper outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0090.md
- .\scripts\frontend\validate-Virtualized-list-wrapper.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Virtualized list wrapper — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0090'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0090'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0090

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0090
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0090 -CheckMarker

## completion_marker
PHASE 0090 COMPLETE
