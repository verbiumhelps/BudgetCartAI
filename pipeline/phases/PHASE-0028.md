# FE: Button primitive — Accessibility

## objective
Ensure Button primitive meets a11y requirements with explicit checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0028.md
- .\docs\frontend\a11y\Button-primitive.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Button primitive — Accessibility'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0028'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0028'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0028

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0028
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0028 -CheckMarker

## completion_marker
PHASE 0028 COMPLETE
