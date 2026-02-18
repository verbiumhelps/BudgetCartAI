# FE: Keyboard avoidance standard — Validation hook

## objective
Add deterministic validation script for Keyboard avoidance standard outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-0048.md
- .\scripts\frontend\validate-Keyboard-avoidance-standard.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Keyboard avoidance standard — Validation hook'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0048'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0048'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0048

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0048
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0048 -CheckMarker

## completion_marker
PHASE 0048 COMPLETE
