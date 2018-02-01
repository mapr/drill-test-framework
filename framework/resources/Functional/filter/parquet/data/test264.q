--keep partition 19-20.  Count is 999.
select count(*) from orders_parts_auto where o_orderpriority = '5-LOW' and double_id > 10000 and bigint_id < 11000;
