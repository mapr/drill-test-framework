--keep partition 1.  Count is 1.
explain plan for select count(*) from orders_parts_auto where o_orderpriority = '1-URGENT' and int_id = -3024;
