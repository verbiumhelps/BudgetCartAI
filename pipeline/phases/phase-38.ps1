# ============================================================
# PHASE 38 — Session persistence + token refresh handling
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\auth\session.ts" @(
  'import { supabaseClient } from ''../lib/supabase/client'';'
  ''
  'export async function getSession() {'
  '  return supabaseClient().auth.getSession();'
  '}'
  ''
  'export function onAuth(cb: (event: string) => void) {'
  '  return supabaseClient().auth.onAuthStateChange((event) => cb(event));'
  '}'
)

Write-Host "PHASE 38 COMPLETE"

