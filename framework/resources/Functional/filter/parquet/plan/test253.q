--keep partition 2-5.  Count is 1995.
explain plan for select count(*) from orders_parts_hier where dir0 = 2015 and o_orderpriority = '1-URGENT' and int_id > -2000 and int_id < 2000;
