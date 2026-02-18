# FE: Empty/Loading/Error pattern (wired) — Implementation

## objective
Unify Empty/Loading/Error with retry hooks and test coverage.

## files_created_or_modified
- .\pipeline\phases\PHASE-0062.md
- .\src\ui\states\Empty.tsx
- .\src\ui\states\Loading.tsx
- .\src\ui\states\Error.tsx
- .\src\ui\states\states.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Empty/Loading/Error pattern (wired) — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0062'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0062'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0062

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0062
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0062 -CheckMarker

## completion_marker
PHASE 0062 COMPLETE
