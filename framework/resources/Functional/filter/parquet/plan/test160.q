-- keep no partition.  count is 0.  test two levels of AND/OR logic
explain plan for select count(*) from orders_parts where ((int_id > -3025 and int_id < -4) and (int_id > 3060 and int_id < 3161)) or ((int_id > -5 and int_id < 3061) and (int_id > 9025 and int_id < 11976));
