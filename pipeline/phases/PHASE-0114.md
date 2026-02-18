# FE: Network state banner — Validation hook

## objective
Add deterministic validation script for Network state banner outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0114.md
- .\scripts\frontend\validate-Network-state-banner.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Network state banner — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0114'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0114'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0114

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0114
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0114 -CheckMarker

## completion_marker
PHASE 0114 COMPLETE
