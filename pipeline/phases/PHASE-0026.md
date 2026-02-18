# FE: Button primitive — Implementation

## objective
Implement Button with variants and disabled/loading states.

## files_created_or_modified
- .\pipeline\phases\PHASE-0026.md
- .\src\ui\Button.tsx
- .\src\ui\button.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Button primitive — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0026'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0026'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0026

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0026
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0026 -CheckMarker

## completion_marker
PHASE 0026 COMPLETE
