# Supabase Infrastructure

This folder contains infrastructure-only Supabase wiring.

Rules:
- Domain layer must not import from src/infrastructure
- UI must not create Supabase clients directly
- Application layer coordinates infrastructure usage
