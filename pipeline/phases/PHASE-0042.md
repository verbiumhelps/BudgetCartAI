# FE: Form state harness — Validation hook

## objective
Add deterministic validation script for Form state harness outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0042.md
- .\scripts\frontend\validate-Form-state-harness.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Form state harness — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0042'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0042'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0042

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0042
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0042 -CheckMarker

## completion_marker
PHASE 0042 COMPLETE
