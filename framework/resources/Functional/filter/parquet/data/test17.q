-- keep partitions 3 and 4. count is 4024.
select count(*) from orders_parts where (double_id > 3500 and double_id <= 4500) or double_id is null;
