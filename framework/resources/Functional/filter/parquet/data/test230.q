--keep partition 1, 2, 5.  Count is 6.
select count(*) from orders_parts where int_id in (-3000, -2000, 10, 20, 3000, 10000, 3000, 3000, 3000, 20000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000);
