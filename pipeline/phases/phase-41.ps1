# ============================================================
# PHASE 41 — Add analytics adapter (src/analytics/events.ts)
# Idempotent. Deterministic. Must pass lint/typecheck gates.
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path ".\src\analytics" | Out-Null
$lines = @(
  "export type AnalyticsEvent = { name: string; props?: Record<string, unknown>; ts: string };",
  "",
  "export function track(name: string, props?: Record<string, unknown>): AnalyticsEvent {",
  "  return { name, props, ts: new Date().toISOString() };",
  "}"
)
Set-Content -Path ".\src\analytics\events.ts" -Value ($lines -join "`n") -Encoding UTF8

Write-Host ("PHASE 41 COMPLETE")

