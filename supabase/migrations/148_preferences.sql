-- preferences scaffold (constraints for recommendations)
create table if not exists public.preferences (
  id uuid primary key default gen_random_uuid(),
  household_id uuid not null references public.households(id) on delete cascade,
  user_id uuid not null,
  brand_exclusions text[] not null default '{}'::text[],
  dietary_flags text[] not null default '{}'::text[],
  created_at timestamptz not null default now()
);

