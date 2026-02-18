# FE: Keyboard avoidance standard — Implementation

## objective
Standardize keyboard avoidance behavior across forms.

## files_created_or_modified
- .\pipeline\phases\PHASE-0044.md
- .\src\ui\KeyboardAware.tsx
- .\src\ui\keyboard.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Keyboard avoidance standard — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0044'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0044'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0044

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0044
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0044 -CheckMarker

## completion_marker
PHASE 0044 COMPLETE
