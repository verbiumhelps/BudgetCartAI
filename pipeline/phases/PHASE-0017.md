# FE: Color + contrast audit harness — Performance

## objective
Define measurable performance expectations for Color + contrast audit harness.

## files_created_or_modified
- .\pipeline\phases\PHASE-0017.md
- .\docs\frontend\perf\Color--contrast-audit-harness.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Color + contrast audit harness — Performance'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0017'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0017'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0017

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0017
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0017 -CheckMarker

## completion_marker
PHASE 0017 COMPLETE
