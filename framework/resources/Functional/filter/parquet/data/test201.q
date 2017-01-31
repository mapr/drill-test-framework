--keep partition 5.  Count is 499.
select count(*) from (select * from orders_parts where int_id > 6000 and float_id < 11000 and int_id > -3000 and float_id < 11000) where int_id > 10000 and float_id > 10500;
