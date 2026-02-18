-- receipt_line_items placeholder (future itemized receipts)
create table if not exists public.receipt_line_items (
  id uuid primary key default gen_random_uuid(),
  receipt_id uuid not null references public.receipts(id) on delete cascade,
  category text,
  label text not null,
  qty numeric,
  unit text,
  price numeric,
  created_at timestamptz not null default now()
);

