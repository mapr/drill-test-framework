-- keep partitions 1,2,3,4.  count is 6024.
select count(*) from orders_parts where (timestamp_id > '2016-09-30 21:16:12.873' and timestamp_id < '2016-10-01 13:57:12.873') or (timestamp_id > '2016-10-02 23:15:52.429' and timestamp_id < '2016-10-03 15:56:52.429') or (timestamp_id > '2016-10-05 17:56:25.406' and timestamp_id < '2016-10-06 10:37:25.406') or date_id is null;
