# ============================================================
# PHASE 141 — Backend — substitution_rules table (canonical → alternatives, similarity)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\141_substitution_rules.sql" @(
  '-- substitution_rules scaffold'
  'create table if not exists public.substitution_rules ('
  '  id uuid primary key default gen_random_uuid(),'
  '  canonical_item_id uuid not null references public.canonical_items(id) on delete cascade,'
  '  alternative_canonical_item_id uuid not null references public.canonical_items(id) on delete cascade,'
  '  similarity_score numeric not null default 0,'
  '  reason text,'
  '  created_at timestamptz not null default now()'
  ');'
  ''
  'create index if not exists idx_sub_rules_item on public.substitution_rules(canonical_item_id);'
)

Write-Host "PHASE 141 COMPLETE"

