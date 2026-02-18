# ============================================================
# PHASE 43 — Create supabase/schema.sql (baseline tables)
# Idempotent. Deterministic. Must pass lint/typecheck gates.
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$sqlPath = ".\supabase\schema.sql"
if (-not (Test-Path $sqlPath)) {
  $lines = @(
    "-- BudgetCartAI — baseline schema (starter)",
    "create table if not exists public.households (",
    "  id uuid primary key default gen_random_uuid(),",
    "  name text not null,",
    "  created_at timestamptz not null default now()",
    ");",
    "",
    "create table if not exists public.household_members (",
    "  household_id uuid not null references public.households(id) on delete cascade,",
    "  user_id uuid not null,",
    "  role text not null default 'member',",
    "  created_at timestamptz not null default now(),",
    "  primary key (household_id, user_id)",
    ");"
  ) -join "`n"
  Set-Content -Path $sqlPath -Value $lines -Encoding UTF8
}

Write-Host ("PHASE 43 COMPLETE")

