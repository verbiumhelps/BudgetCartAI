# ============================================================
# PHASE 62 — audit_log table for membership changes (SQL scaffold)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\062_audit_log.sql" @(
  '-- audit_log scaffold for membership changes'
  'create table if not exists public.audit_log ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  actor_user_id uuid not null,'
  '  action text not null,'
  '  target_user_id uuid,'
  '  metadata jsonb not null default ''{}''::jsonb,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 62 COMPLETE"

