-- RLS scaffold for grocery lists + items
alter table public.grocery_lists enable row level security;
alter table public.grocery_list_items enable row level security;

-- TODO policies:
-- - household members can read/write lists for their household
-- - items readable/writable only via list household membership

