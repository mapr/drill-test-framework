--keep partition 2-5.  Count is 1995.
explain plan for select count(*) from orders_parts_auto where o_orderpriority = '1-URGENT' and int_id > -2000 and float_id < 2000;
