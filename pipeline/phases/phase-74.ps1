# ============================================================
# PHASE 74 — RLS for lists + items (household membership enforced)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\074_lists_rls.sql" @(
  '-- RLS scaffold for grocery lists + items'
  'alter table public.grocery_lists enable row level security;'
  'alter table public.grocery_list_items enable row level security;'
  ''
  '-- TODO policies:'
  '-- - household members can read/write lists for their household'
  '-- - items readable/writable only via list household membership'
)

Write-Host "PHASE 74 COMPLETE"

