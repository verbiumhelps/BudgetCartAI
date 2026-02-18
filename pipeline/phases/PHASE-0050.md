# FE: Screen shell pattern — Implementation

## objective
Create ScreenShell enforcing safe-area, header, scroll, and padding rules.

## files_created_or_modified
- .\pipeline\phases\PHASE-0050.md
- .\src\ui\ScreenShell.tsx
- .\src\ui\screenshell.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Screen shell pattern — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0050'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0050'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0050

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0050
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0050 -CheckMarker

## completion_marker
PHASE 0050 COMPLETE
