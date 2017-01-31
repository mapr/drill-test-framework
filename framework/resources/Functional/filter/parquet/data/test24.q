-- keep partitions 1, 3, 5
select count(*) from orders_parts where (date_id > '2008-07-17' and date_id < '2011-04-14') or (date_id > '2027-09-16' and date_id < '2030-06-13') or (date_id > '2042-10-07' and date_id < '2045-07-04');
