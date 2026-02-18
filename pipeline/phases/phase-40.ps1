# ============================================================
# PHASE 40 — Auth guard + protected route layout (Expo Router-friendly stubs)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\auth\guard.ts" @(
  'import { getSession } from ''./session'';'
  ''
  'export async function requireSession() {'
  '  const r = await getSession();'
  '  const session = r.data.session;'
  '  if (!session) throw new Error(''No active session'');'
  '  return session;'
  '}'
)

Write-Host "PHASE 40 COMPLETE"

