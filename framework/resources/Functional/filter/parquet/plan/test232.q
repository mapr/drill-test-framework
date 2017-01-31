--keep partition 1, 2.  Count is 19.
explain plan for select count(*) from orders_parts where int_id in (-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8);
