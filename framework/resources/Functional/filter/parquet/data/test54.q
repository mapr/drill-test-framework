-- keep partitions 2,3,4,5.  count is 6024.
select count(*) from orders_parts where (time_id > '01:17:59.160' and time_id < '01:34:40.160') or (time_id > '02:25:15.073' and time_id < '02:41:56.073') or (time_id is null) or (time_id > '03:57:34.827' and time_id < '04:14:15.827');
