--keep no partition.  Count is 0.
explain plan for select count(*) from orders_parts_view2 where my_int > 2000 and my_int < 3334;
