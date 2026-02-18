# FE: Color + contrast audit harness — Validation hook

## objective
Add deterministic validation script for Color + contrast audit harness outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0018.md
- .\scripts\frontend\validate-Color--contrast-audit-harness.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Color + contrast audit harness — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0018'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0018'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0018

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0018
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0018 -CheckMarker

## completion_marker
PHASE 0018 COMPLETE
