# FE: Spacing + layout primitives — Implementation

## objective
Create layout primitives that standardize padding/gap/safe-area behavior.

## files_created_or_modified
- .\pipeline\phases\PHASE-0020.md
- .\src\ui\Layout.tsx
- .\src\ui\layout.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Spacing + layout primitives — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0020'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0020'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0020

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0020
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0020 -CheckMarker

## completion_marker
PHASE 0020 COMPLETE
