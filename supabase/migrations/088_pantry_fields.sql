-- add pantry fields scaffold
alter table public.pantry_items add column if not exists quantity numeric;
alter table public.pantry_items add column if not exists unit text;
alter table public.pantry_items add column if not exists purchased_at date;
alter table public.pantry_items add column if not exists expires_at date;

