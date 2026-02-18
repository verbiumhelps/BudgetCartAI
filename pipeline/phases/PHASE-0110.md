# FE: Network state banner — Implementation

## objective
Standardize offline/online banner and retry queue UX.

## files_created_or_modified
- .\pipeline\phases\PHASE-0110.md
- .\src\ui\NetworkBanner.tsx
- .\src\ui\networkbanner.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Network state banner — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0110'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0110'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0110

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0110
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0110 -CheckMarker

## completion_marker
PHASE 0110 COMPLETE
