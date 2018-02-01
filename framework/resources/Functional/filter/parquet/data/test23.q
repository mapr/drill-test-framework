-- keep partitions 1, 3, 4.  count is 5024.
select count(*) from orders_parts where (date_id > '2008-07-17' and date_id < '2011-04-14') or (date_id > '2027-09-16' and date_id < '2030-06-13') or date_id is null;
