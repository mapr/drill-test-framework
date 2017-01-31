-- keep no partitions.  count is 0
explain plan for select count(*) from orders_parts where (int_id = -3025) or (int_id < -3024) or (int_id > 11975) or (int_id = 11976);
