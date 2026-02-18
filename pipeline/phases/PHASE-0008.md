# FE: Typography system — Implementation

## objective
Implement deterministic type styles with named variants.

## files_created_or_modified
- .\pipeline\phases\PHASE-0008.md
- .\src\ui\Typography.tsx
- .\src\ui\typography.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Typography system — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0008'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0008'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0008

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0008
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0008 -CheckMarker

## completion_marker
PHASE 0008 COMPLETE
