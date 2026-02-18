# FE: Bottom sheet primitive — Implementation

## objective
Implement bottom sheet with focus management and snap points.

## files_created_or_modified
- .\pipeline\phases\PHASE-0074.md
- .\src\ui\BottomSheet.tsx
- .\src\ui\bottomsheet.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Bottom sheet primitive — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0074'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0074'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0074

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0074
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0074 -CheckMarker

## completion_marker
PHASE 0074 COMPLETE
