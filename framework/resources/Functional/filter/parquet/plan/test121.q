-- keep partition 1, 3.  adding join on the same table.
explain plan for select count(*) from orders_parts where bigint_id = float_id and (bigint_id > -3000 and bigint_id < -1999) or (float_id >= 4000.0 and float_id <= 4999.0);
