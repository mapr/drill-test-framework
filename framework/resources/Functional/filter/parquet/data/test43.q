-- keep partitions 1,3,4,5.  count is 3027.
select count(*) from orders_parts where (timestamp_id = '2016-09-30 21:16:12.873') or (timestamp_id = '2016-10-05 17:56:25.406') or (timestamp_id is null) or (timestamp_id = '2016-10-09 13:36:38.986');
