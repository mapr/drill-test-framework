-- keep partitions 4 and 5,  count is 3025.
select count(*) from orders_parts where (double_id is null) or (double_id = 10000);
