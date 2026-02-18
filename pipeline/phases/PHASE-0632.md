# BE: Monetization enforcement — gates matrix (0632)

## objective
Implement and verify backend hardening for Monetization enforcement: gates matrix with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0632.md
- .\docs\backend\phases\0632-Monetization-enforcement-gates-matrix.md
- .\supabase\migrations\20260218_0632_Monetization_enforcement_gates_matrix.sql
- .\__tests__\backend\0632.Monetization-enforcement.gates-matrix.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Monetization enforcement — gates matrix (0632)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0632'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0632'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0632

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0632
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0632 -CheckMarker

## completion_marker
PHASE 0632 COMPLETE
