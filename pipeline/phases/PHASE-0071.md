# FE: Toast/Notice system — Performance

## objective
Define measurable performance expectations for Toast/Notice system.

## files_created_or_modified
- .\pipeline\phases\PHASE-0071.md
- .\docs\frontend\perf\ToastNotice-system.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Toast/Notice system — Performance'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0071'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0071'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0071

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0071
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0071 -CheckMarker

## completion_marker
PHASE 0071 COMPLETE
