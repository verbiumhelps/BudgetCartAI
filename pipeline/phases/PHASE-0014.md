# FE: Color + contrast audit harness — Implementation

## objective
Add automated contrast checks for all token pairs used by components.

## files_created_or_modified
- .\pipeline\phases\PHASE-0014.md
- .\src\ui\contrast.audit.ts
- .\scripts\run-contrast-audit.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Color + contrast audit harness — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0014'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0014'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0014

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0014
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0014 -CheckMarker

## completion_marker
PHASE 0014 COMPLETE
