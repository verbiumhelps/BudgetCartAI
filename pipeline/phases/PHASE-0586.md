# BE: Data moat — price normalization (0586)

## objective
Implement and verify backend hardening for Data moat: price normalization with deterministic checks.

## files_created_or_modified
- .\pipeline\phases\PHASE-0586.md
- .\docs\backend\phases\0586-Data-moat-price-normalization.md
- .\supabase\migrations\20260218_0586_Data_moat_price_normalization.sql
- .\__tests__\backend\0586.Data-moat.price-normalization.spec.ts

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# BE: Data moat — price normalization (0586)'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 0586'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 0586'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 0586

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0586
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 0586 -CheckMarker

## completion_marker
PHASE 0586 COMPLETE
