--keep partition 1, 2, 3.  Count is 6009.
explain plan for select count(*) from (select * from orders_parts where int_id > -3000 and float_id < 11000 and int_id > -10 and float_id < 6000) where int_id > -3000 or float_id < -6;
