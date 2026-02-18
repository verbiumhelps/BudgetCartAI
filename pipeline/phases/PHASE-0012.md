# FE: Typography system — Validation hook

## objective
Add deterministic validation script for Typography system outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0012.md
- .\scripts\frontend\validate-Typography-system.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Typography system — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0012'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0012'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0012

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0012
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0012 -CheckMarker

## completion_marker
PHASE 0012 COMPLETE
