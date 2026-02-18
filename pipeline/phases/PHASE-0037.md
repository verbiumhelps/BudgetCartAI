# FE: Form state harness — Contract

## objective
Create a deterministic contract for: Form state harness.

## files_created_or_modified
- .\pipeline\phases\PHASE-0037.md
- .\docs\frontend\contracts\Form-state-harness.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Form state harness — Contract'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0037'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0037'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0037

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0037
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0037 -CheckMarker

## completion_marker
PHASE 0037 COMPLETE
