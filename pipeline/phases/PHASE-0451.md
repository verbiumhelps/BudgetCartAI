# BE: Data moat — price normalization (0451)

## objective
Implement and verify backend hardening for Data moat: price normalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0451.md
- .\docs\backend\phases\0451-Data-moat-price-normalization.md
- .\supabase\migrations\20260218_0451_Data_moat_price_normalization.sql
- .\__tests__\backend\0451.Data-moat.price-normalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — price normalization (0451)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0451'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0451'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0451

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0451
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0451 -CheckMarker

## completion_marker
PHASE 0451 COMPLETE
