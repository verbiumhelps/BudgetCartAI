# ============================================================
# PHASE 33 — Add .editorconfig (repo-wide formatting baseline)
# Idempotent. Deterministic. Must pass lint/typecheck gates.
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path ".\.editorconfig")) {
  $lines = @(
    "root = true",
    "",
    "[*]",
    "charset = utf-8",
    "end_of_line = lf",
    "insert_final_newline = true",
    "indent_style = space",
    "indent_size = 2",
    "trim_trailing_whitespace = true",
    "",
    "[*.md]",
    "trim_trailing_whitespace = false"
  )
  Set-Content -Path ".\.editorconfig" -Value ($lines -join "`n") -Encoding UTF8
}

Write-Host ("PHASE 33 COMPLETE")

