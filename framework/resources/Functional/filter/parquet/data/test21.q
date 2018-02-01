-- keep partitions 1, 2, 4.  count is 5024.
select count(*) from orders_parts where (date_id > '2008-07-17' and date_id < '2011-04-14') or (date_id > '2016-10-03' and date_id < '2019-07-01') or (date_id is null);
