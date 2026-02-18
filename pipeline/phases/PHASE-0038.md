# FE: Form state harness — Implementation

## objective
Add deterministic form state + validation adapter layer.

## files_created_or_modified
- .\pipeline\phases\PHASE-0038.md
- .\src\ui\forms\useForm.ts
- .\src\ui\forms\validators.ts
- .\src\ui\forms\form.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# FE: Form state harness — Implementation'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0038'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0038'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0038

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0038
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0038 -CheckMarker

## completion_marker
PHASE 0038 COMPLETE
