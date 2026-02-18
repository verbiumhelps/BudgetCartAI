# FE: Input primitive — Implementation

## objective
Implement Input with validation states and a11y labels.

## files_created_or_modified
- .\pipeline\phases\PHASE-0032.md
- .\src\ui\Input.tsx
- .\src\ui\input.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Input primitive — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0032'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0032'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0032

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0032
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0032 -CheckMarker

## completion_marker
PHASE 0032 COMPLETE
