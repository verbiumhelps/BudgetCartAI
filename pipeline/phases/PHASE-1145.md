# QA: End-to-end scenario library

## objective
Create deterministic e2e scenario scripts and acceptance gates.

## files_created_or_modified
- .\pipeline\phases\PHASE-1145.md
- .\__tests__\e2e\scenario-library.md
- .\__tests__\e2e\scenarios.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# QA: End-to-end scenario library'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1145'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1145'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1145

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1145
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1145 -CheckMarker

## completion_marker
PHASE 1145 COMPLETE
