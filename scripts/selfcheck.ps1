Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "=== Selfcheck ==="

# Try to import core modules via ts-node is not assumed.
# Instead, validate that files exist and TypeScript gate remains authoritative.
$required = @(
  ".\src\domain\types.ts",
  ".\src\domain\entities.ts",
  ".\src\state\budget.ts",
  ".\src\state\pantry.ts",
  ".\src\ai\recommendations.ts"
)

foreach ($p in $required) {
  if (-not (Test-Path $p)) { throw "Missing required file: $p" }
}

Write-Host "SELFHECK PASS: required artifacts present"

