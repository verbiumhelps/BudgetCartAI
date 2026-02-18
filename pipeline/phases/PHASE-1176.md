# Growth: Monetization KPI dashboard spec

## objective
Create KPI definitions + reporting contract for cohorts.

## files_created_or_modified
- .\pipeline\phases\PHASE-1176.md
- .\docs\growth\kpi-dashboard.md
- .\docs\growth\cohort-metrics.md

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# Growth: Monetization KPI dashboard spec'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1176'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1176'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1176

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1176
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1176 -CheckMarker

## completion_marker
PHASE 1176 COMPLETE
