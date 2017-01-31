-- keep partition 1, 2, 3, 5.  adding join on the same table.
explain plan for select count(*) from orders_parts where int_id = bigint_id and bigint_id = float_id and float_id = double_id and (int_id > 0 and int_id < 1001) or (bigint_id > -3000 and bigint_id < -1999) or (float_id >= 4000.0 and float_id <= 4999.0) or (double_id >= 9500 and double_id <= 10499);
