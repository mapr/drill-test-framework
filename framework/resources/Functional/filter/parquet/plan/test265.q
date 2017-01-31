--keep partition 21.  Count is 1.
explain plan for select * from orders_parts_auto where o_orderpriority = '5-LOW' and double_id = 11975;
