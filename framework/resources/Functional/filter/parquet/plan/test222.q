--keep partition 3.  Count is 1.
explain plan for select * from orders_parts_view2 where my_int > 2000 and my_int < 3335;
