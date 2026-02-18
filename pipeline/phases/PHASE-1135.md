# Growth: Paywall experiment harness

## objective
Add deterministic experiment config schema + validation harness.

## files_created_or_modified
- .\pipeline\phases\PHASE-1135.md
- .\src\growth\experiments.schema.json
- .\src\growth\experiments.ts
- .\scripts\growth\validate-experiments.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# Growth: Paywall experiment harness'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1135'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1135'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1135

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1135
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1135 -CheckMarker

## completion_marker
PHASE 1135 COMPLETE
