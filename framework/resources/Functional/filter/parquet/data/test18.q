-- keep partitions 3 and 5
select count(*) from orders_parts where (double_id >= 4100 and double_id < 5100) or (double_id > 9300 and double_id < 10301);
