Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "=== Gate Runner ==="

function Require-Command([string]$cmd) {
  $c = Get-Command $cmd -ErrorAction SilentlyContinue
  if (-not $c) { throw "Required command not found: $cmd" }
}

Require-Command "node"
Require-Command "npm"

# Deterministic gate order: lint then typecheck
Write-Host "Running: npm run lint"
npm run -s lint

Write-Host "Running: npm run typecheck"
npm run -s typecheck

Write-Host "GATES PASS"

