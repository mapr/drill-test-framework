-- keep partitions 1,2,3,5.  count is 4000.
explain plan for select count(*) from orders_parts where (time_id > '00:27:15.873' and time_id < '00:43:56.873') or (time_id > '01:17:59.160' and time_id < '01:34:40.160') or (time_id > '02:25:15.073' and time_id < '02:41:56.073') or (time_id > '03:57:34.827' and time_id < '04:14:15.827');
