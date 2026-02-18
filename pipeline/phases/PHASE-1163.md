# DevOps: CI matrix hardening

## objective
Implement CI matrix for lint/type/test/build with deterministic outputs.

## files_created_or_modified
- .\pipeline\phases\PHASE-1163.md
- .\.github\workflows\ci.yml
- .\docs\devops\ci-matrix.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# DevOps: CI matrix hardening'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1163'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1163'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1163

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1163
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1163 -CheckMarker

## completion_marker
PHASE 1163 COMPLETE
