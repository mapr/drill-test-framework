--keep partition 2, 3.  Count is 5999.
select count(*) from (select * from orders_parts where int_id > -3000 and float_id < 11000 and int_id > 0 and float_id < 6000) where int_id > 0 or float_id < 11000;
