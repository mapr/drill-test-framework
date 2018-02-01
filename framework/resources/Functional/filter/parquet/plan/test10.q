-- keep partitions 1 and 2.  count is 3100.
explain plan for select count(*) from orders_parts where bigint_id <= 75;
