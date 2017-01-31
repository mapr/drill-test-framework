-- keep partitions 1,2,3,4.  count is 5025.
select count(*) from orders_parts where (timestamp_id > '2016-09-30 21:16:12.873' and timestamp_id <= '2016-10-01 13:56:12.873') or (timestamp_id >= '2016-10-02 23:15:52.429' and timestamp_id < '2016-10-03 15:55:52.429') or (timestamp_id = '2016-10-05 17:56:25.406') or timestamp_id is null;
