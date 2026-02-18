# BE: Data moat — price normalization (1081)

## objective
Implement and verify backend hardening for Data moat: price normalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-1081.md
- .\docs\backend\phases\1081-Data-moat-price-normalization.md
- .\supabase\migrations\20260218_1081_Data_moat_price_normalization.sql
- .\__tests__\backend\1081.Data-moat.price-normalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — price normalization (1081)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1081'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1081'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1081

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1081
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1081 -CheckMarker

## completion_marker
PHASE 1081 COMPLETE
