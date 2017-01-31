-- keep partitions 1,3,4,5.  count is 3027.
select count(*) from orders_parts where (time_id = '00:27:15.873') or (time_id = '02:25:15.073') or (time_id is null) or (time_id = '03:57:34.827');
