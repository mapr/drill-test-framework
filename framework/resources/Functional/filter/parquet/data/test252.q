--keep partition 10.  Count is 4.
select * from orders_parts_hier where dir0 in (2015 ,2016) and o_orderpriority > '1-URGENT' and o_orderpriority < '5-LOW' and int_id > 3050 and int_id < 3055;
