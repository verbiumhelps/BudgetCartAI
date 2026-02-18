# ============================================================
# PHASE 42 — Add GitHub Actions CI (lint + typecheck)
# Idempotent. Deterministic. Must pass lint/typecheck gates.
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path ".\.github\workflows" | Out-Null
$path = ".\.github\workflows\ci.yml"
if (-not (Test-Path $path)) {
  $y = @(
    "name: CI",
    "",
    "on:",
    "  push:",
    "  pull_request:",
    "",
    "jobs:",
    "  validate:",
    "    runs-on: ubuntu-latest",
    "    steps:",
    "      - name: Checkout",
    "        uses: actions/checkout@v4",
    "",
    "      - name: Setup Node",
    "        uses: actions/setup-node@v4",
    "        with:",
    "          node-version: '20'",
    "          cache: 'npm'",
    "",
    "      - name: Install",
    "        run: npm ci",
    "",
    "      - name: Lint",
    "        run: npm run lint",
    "",
    "      - name: Typecheck",
    "        run: npm run typecheck"
  ) -join "`n"
  Set-Content -Path $path -Value $y -Encoding UTF8
}

Write-Host ("PHASE 42 COMPLETE")

