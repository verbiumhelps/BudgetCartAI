# FE: Typography system — Contract

## objective
Create a deterministic contract for: Typography system.

## files_created_or_modified
- .\pipeline\phases\PHASE-0007.md
- .\docs\frontend\contracts\Typography-system.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Typography system — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0007'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0007'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0007

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0007
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0007 -CheckMarker

## completion_marker
PHASE 0007 COMPLETE
