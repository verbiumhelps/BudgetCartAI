# DevOps: Observability wiring

## objective
Wire error/crash reporting and structured logs pipeline hooks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1156.md
- .\src\obs\logger.ts
- .\docs\devops\observability.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# DevOps: Observability wiring'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1156'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1156'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1156

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1156
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1156 -CheckMarker

## completion_marker
PHASE 1156 COMPLETE
