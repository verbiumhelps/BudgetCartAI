# DevOps: Release train

## objective
Add deterministic versioning and release checklist automation.

## files_created_or_modified
- .\pipeline\phases\PHASE-1125.md
- .\scripts\release\prepare-release.ps1
- .\docs\devops\release-train.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# DevOps: Release train'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1125'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1125'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1125

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1125
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1125 -CheckMarker

## completion_marker
PHASE 1125 COMPLETE
