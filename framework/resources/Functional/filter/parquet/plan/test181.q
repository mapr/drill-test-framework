--keep partition 3.  Count is 9.
explain plan for select count(*) from orders_parts where ((int_id > -3025 and int_id < -2000) or (int_id > -5 and int_id < 1000) or (int_id > 3060 and int_id < 6000) or (int_id > 9025 and int_id < 11976)) and ((int_id > 2000 and int_id < 3061) or (int_id > 3200 and int_id < 3300)) and (int_id > 3280 and int_id < 3290);
