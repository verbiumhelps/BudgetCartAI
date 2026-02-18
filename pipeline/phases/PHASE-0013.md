# FE: Color + contrast audit harness — Contract

## objective
Create a deterministic contract for: Color + contrast audit harness.

## files_created_or_modified
- .\pipeline\phases\PHASE-0013.md
- .\docs\frontend\contracts\Color--contrast-audit-harness.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Color + contrast audit harness — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0013'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0013'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0013

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0013
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0013 -CheckMarker

## completion_marker
PHASE 0013 COMPLETE
