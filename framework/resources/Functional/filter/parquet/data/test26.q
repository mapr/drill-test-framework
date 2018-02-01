-- keep partitions 2, 3, 4.  count is 5024.
select count(*) from orders_parts where (date_id >= '2016-10-03' and date_id <= '2019-06-29') or (date_id >= '2027-09-16' and date_id <= '2030-06-11') or date_id is null;
