# ============================================================
# PHASE 49 — CI env checks + secret handling notes (workflow/doc additions)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\devops\ci-env-secrets.md" @(
  '# CI Env + Secrets'
  ''
  '## Required env (build/test)'
  '- EXPO_PUBLIC_SUPABASE_URL'
  '- EXPO_PUBLIC_SUPABASE_ANON_KEY'
  ''
  '## Policy'
  '- Never commit .env'
  '- Use CI secret store'
  '- Validate env at startup (fail fast)'
  ''
  '## Next'
  '- Add workflow step that asserts env vars exist before lint/typecheck/test.'
)

Write-Host "PHASE 49 COMPLETE"

