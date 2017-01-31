--keep partition 5.  Count is 974.
explain plan for select count(*) from orders_parts_view1 where my_int >= 8000 and my_int < 10000;
