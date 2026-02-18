-- substitution_rules scaffold
create table if not exists public.substitution_rules (
  id uuid primary key default gen_random_uuid(),
  canonical_item_id uuid not null references public.canonical_items(id) on delete cascade,
  alternative_canonical_item_id uuid not null references public.canonical_items(id) on delete cascade,
  similarity_score numeric not null default 0,
  reason text,
  created_at timestamptz not null default now()
);

create index if not exists idx_sub_rules_item on public.substitution_rules(canonical_item_id);

