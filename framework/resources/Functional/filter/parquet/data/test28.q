-- keep partitions 2, 4, 5.  count is 5024.
select count(*) from orders_parts where (date_id >= '2016-10-03' and date_id <= '2019-06-29') or (date_id is null) or (date_id >= '2042-10-07' and date_id <= '2045-07-02');
