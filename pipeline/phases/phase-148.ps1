# ============================================================
# PHASE 148 — Backend — Personalized preference constraints (brand exclusions, dietary flags)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\148_preferences.sql" @(
  '-- preferences scaffold (constraints for recommendations)'
  'create table if not exists public.preferences ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  user_id uuid not null,'
  '  brand_exclusions text[] not null default ''{}''::text[],'
  '  dietary_flags text[] not null default ''{}''::text[],'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 148 COMPLETE"

