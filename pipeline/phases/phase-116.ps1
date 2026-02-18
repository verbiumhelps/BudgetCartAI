Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 116 — Infrastructure Foundation (Escaped Template Literals Safe)

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

function Ensure-Dir {
    param([Parameter(Mandatory=$true)][string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

# Directories
$srcDir   = Join-Path $repoRoot "src"
$infraDir = Join-Path $srcDir "infrastructure"
$cfgDir   = Join-Path $infraDir "config"
$sbDir    = Join-Path $infraDir "supabase"
$docsDir  = Join-Path $repoRoot "docs"

Ensure-Dir -Path $srcDir
Ensure-Dir -Path $infraDir
Ensure-Dir -Path $cfgDir
Ensure-Dir -Path $sbDir
Ensure-Dir -Path $docsDir

# Files
$envFile     = Join-Path $cfgDir "env.ts"
$clientFile  = Join-Path $sbDir "client.ts"
$readmeFile  = Join-Path $sbDir "README.md"
$docsFile    = Join-Path $docsDir "infrastructure-foundation.md"

# Use single-quoted here-strings to prevent PowerShell interpolation
$envContent = @'
export type Env = {
  SUPABASE_URL: string;
  SUPABASE_ANON_KEY: string;
};

function requireNonEmpty(name: string, value: string | undefined): string {
  if (!value || value.trim().length === 0) {
    throw new Error(`Missing required env var: ${name}`);
  }
  return value;
}

/**
 * Single source of truth for runtime configuration.
 */
export function getEnv(): Env {
  const url =
    (globalThis as any)?.process?.env?.EXPO_PUBLIC_SUPABASE_URL ??
    (globalThis as any)?.process?.env?.SUPABASE_URL;

  const anonKey =
    (globalThis as any)?.process?.env?.EXPO_PUBLIC_SUPABASE_ANON_KEY ??
    (globalThis as any)?.process?.env?.SUPABASE_ANON_KEY;

  return {
    SUPABASE_URL: requireNonEmpty(
      "SUPABASE_URL (or EXPO_PUBLIC_SUPABASE_URL)",
      url
    ),
    SUPABASE_ANON_KEY: requireNonEmpty(
      "SUPABASE_ANON_KEY (or EXPO_PUBLIC_SUPABASE_ANON_KEY)",
      anonKey
    ),
  };
}
'@

$clientContent = @'
import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import { getEnv } from "../config/env";

let _client: SupabaseClient | null = null;

export function getSupabaseClient(): SupabaseClient {
  if (_client) return _client;

  const env = getEnv();

  _client = createClient(env.SUPABASE_URL, env.SUPABASE_ANON_KEY, {
    auth: {
      persistSession: true,
      autoRefreshToken: true,
      detectSessionInUrl: false,
    },
  });

  return _client;
}
'@

$sbReadme = @'
# Supabase Infrastructure

This folder contains infrastructure-only Supabase wiring.

Rules:
- Domain layer must not import from src/infrastructure
- UI must not create Supabase clients directly
- Application layer coordinates infrastructure usage
'@

$docsContent = @'
# Infrastructure Foundation

This phase introduces:

- Typed environment configuration
- Centralized Supabase client factory
- Strict architectural boundary enforcement

No business logic is introduced in this phase.
'@

Set-Content -Path $envFile    -Value $envContent   -Encoding UTF8 -Force
Set-Content -Path $clientFile -Value $clientContent -Encoding UTF8 -Force
Set-Content -Path $readmeFile -Value $sbReadme     -Encoding UTF8 -Force
Set-Content -Path $docsFile   -Value $docsContent  -Encoding UTF8 -Force

Write-Host "PHASE 116 COMPLETE"
