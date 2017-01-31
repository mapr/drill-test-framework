--keep partition 6-14.  Count is 5901.
explain plan for select count(*) from orders_parts_auto where o_orderpriority > '1-URGENT' and o_orderpriority < '5-LOW' and int_id > 100;
