# ============================================================
# PHASE 112 — Category spend breakdown schema (receipt line items placeholder)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\112_receipt_line_items_placeholder.sql" @(
  '-- receipt_line_items placeholder (future itemized receipts)'
  'create table if not exists public.receipt_line_items ('
  '  id uuid primary key default gen_random_uuid(),'
  '  receipt_id uuid not null references public.receipts(id) on delete cascade,'
  '  category text,'
  '  label text not null,'
  '  qty numeric,'
  '  unit text,'
  '  price numeric,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 112 COMPLETE"

