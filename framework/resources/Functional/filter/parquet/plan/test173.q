-- keep partition 2.  count is 3065.
explain plan for select count(*) from orders_parts where (((int_id > -3025 and int_id < -4) or (int_id > -5 and int_id < 3061) or (int_id > 3060 and int_id < 6002)) and (int_id > -5 and int_id < 3061)) and (((int_id > -5 and int_id < 3061) or (int_id > 9025 and int_id < 11976)) and (int_id > -5 and int_id < 3061));
