# ============================================================
# PHASE 131 — Backend — Volatility tracking view (7d/30d min/max/avg)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\131_price_volatility.sql" @(
  '-- volatility view scaffold (7d/30d)'
  'create or replace view public.price_volatility as'
  'select'
  '  store_item_id,'
  '  min(price) filter (where captured_at >= now() - interval ''7 days'')  as min_7d,'
  '  max(price) filter (where captured_at >= now() - interval ''7 days'')  as max_7d,'
  '  avg(price) filter (where captured_at >= now() - interval ''7 days'')  as avg_7d,'
  '  min(price) filter (where captured_at >= now() - interval ''30 days'') as min_30d,'
  '  max(price) filter (where captured_at >= now() - interval ''30 days'') as max_30d,'
  '  avg(price) filter (where captured_at >= now() - interval ''30 days'') as avg_30d'
  'from public.prices'
  'group by store_item_id;'
)

Write-Host "PHASE 131 COMPLETE"

