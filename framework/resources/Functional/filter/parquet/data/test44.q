-- keep partitions 2,3,4,5.  count is 6024.
select count(*) from orders_parts where (timestamp_id > '2016-10-02 23:15:52.429' and timestamp_id < '2016-10-03 15:56:52.429') or (timestamp_id >= '2016-10-05 17:56:25.406' and timestamp_id <= '2016-10-06 10:35:25.406') or (date_id is null) or (timestamp_id > '2016-10-09 13:36:38.986' and timestamp_id < '2016-10-10 06:17:38.986');
