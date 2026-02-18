# FE: Header pattern — Implementation

## objective
Create Header component with title/subtitle/actions and deterministic sizing.

## files_created_or_modified
- .\pipeline\phases\PHASE-0056.md
- .\src\ui\Header.tsx
- .\src\ui\header.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Header pattern — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0056'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0056'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0056

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0056
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0056 -CheckMarker

## completion_marker
PHASE 0056 COMPLETE
