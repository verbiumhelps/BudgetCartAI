# FE: Virtualized list wrapper — Implementation

## objective
Add VirtualList wrapper and enforce item renderer memoization.

## files_created_or_modified
- .\pipeline\phases\PHASE-0086.md
- .\src\ui\VirtualList.tsx
- .\src\ui\virtuallist.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Virtualized list wrapper — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0086'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0086'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0086

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0086
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0086 -CheckMarker

## completion_marker
PHASE 0086 COMPLETE
