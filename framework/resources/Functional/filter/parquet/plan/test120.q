-- keep partition 1, 3.  adding join on the same table.
explain plan for select count(*) from orders_parts where int_id = double_id and (int_id > -3000 and int_id < -1999) or (double_id >= 4000 and double_id <= 4999);
