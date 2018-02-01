--keep partition 1.  Count is 0.
explain plan for select count(*) from orders_parts_view1 where my_int = -2000 and my_float = -10;
