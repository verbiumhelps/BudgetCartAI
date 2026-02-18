# Growth: Analytics taxonomy lock

## objective
Define and validate event taxonomy and required properties.

## files_created_or_modified
- .\pipeline\phases\PHASE-1190.md
- .\docs\growth\analytics-taxonomy.md
- .\scripts\growth\validate-analytics.ps1

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# Growth: Analytics taxonomy lock'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE 1190'
- Any test outputs must be non-empty and include a test name containing: 'PHASE 1190'

## runner
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId 1190

## validation_steps
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1190
- pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId 1190 -CheckMarker

## completion_marker
PHASE 1190 COMPLETE
