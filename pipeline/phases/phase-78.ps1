# ============================================================
# PHASE 78 — Fast search: local-first item search + recent items
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\lists\itemSearch.ts" @(
  'export type SearchItem = { id?: string; label: string; canonical_item_id?: string };'
  ''
  'export function localSearch(query: string, items: SearchItem[]): SearchItem[] {'
  '  const q = query.trim().toLowerCase();'
  '  if (!q) return [];'
  '  return items'
  '    .filter(i => i.label.toLowerCase().includes(q))'
  '    .slice(0, 25);'
  '}'
)

Write-Host "PHASE 78 COMPLETE"

