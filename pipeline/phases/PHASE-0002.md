# FE: Design tokens lock — Implementation

## objective
Freeze token schema and enforce runtime validation.

## files_created_or_modified
- .\pipeline\phases\PHASE-0002.md
- .\src\design\tokens.ts
- .\src\design\tokens.schema.json
- .\scripts\validate-tokens.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Design tokens lock — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0002'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0002'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0002

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0002
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0002 -CheckMarker

## completion_marker
PHASE 0002 COMPLETE
