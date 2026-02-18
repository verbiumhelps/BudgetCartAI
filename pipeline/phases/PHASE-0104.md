# FE: Error taxonomy (frontend) — Implementation

## objective
Create typed UI error mapping to deterministic messages.

## files_created_or_modified
- .\pipeline\phases\PHASE-0104.md
- .\src\errors\ui-errors.ts
- .\src\errors\ui-errors.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Error taxonomy (frontend) — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0104'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0104'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0104

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0104
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0104 -CheckMarker

## completion_marker
PHASE 0104 COMPLETE
