--keep no partition.  Count is 0.
explain plan for select count(*) from orders_parts_auto where o_orderpriority = '1-URGENT' and int_id = 10;
