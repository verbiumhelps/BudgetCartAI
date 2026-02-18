# ============================================================
# PHASE 125 — Backend — Ingest pipeline v0 (CSV/manual upload into prices)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\scripts\ingest-prices-v0.ps1" @(
  'Set-StrictMode -Version Latest'
  '$ErrorActionPreference = "Stop"'
  ''
  '# Stub: implement CSV->prices ingestion later (admin-only).'
  '# Input expected columns: store_item_id, price, unit_price(optional), captured_at(optional ISO).'
  'Write-Host ''INGEST PRICES V0: STUB (implement later with Supabase service key)'''
)

Write-Host "PHASE 125 COMPLETE"

