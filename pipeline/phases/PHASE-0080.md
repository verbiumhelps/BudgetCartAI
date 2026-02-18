# FE: ListRow primitive — Implementation

## objective
Implement ListRow with left/right slots and press states.

## files_created_or_modified
- .\pipeline\phases\PHASE-0080.md
- .\src\ui\ListRow.tsx
- .\src\ui\listrow.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: ListRow primitive — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0080'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0080'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0080

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0080
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0080 -CheckMarker

## completion_marker
PHASE 0080 COMPLETE
