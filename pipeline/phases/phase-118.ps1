# ============================================================
# PHASE 118 — Projected savings model v0 (rule-based placeholders)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\118_projected_savings_placeholder.sql" @(
  '-- placeholder for projected savings model inputs'
  '-- (actual logic may live in RPC / edge function later)'
  'create table if not exists public.projected_savings_inputs ('
  '  household_id uuid primary key references public.households(id) on delete cascade,'
  '  assumptions jsonb not null default ''{}''::jsonb,'
  '  updated_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 118 COMPLETE"

