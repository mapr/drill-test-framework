-- keep partitions 2 and 3.  count is 2
select count(*) from orders_parts where float_id >= 3060 and float_id < 3062;
