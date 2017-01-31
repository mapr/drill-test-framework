--keep partition 3.  Count is 2941.
explain plan for select count(*) from orders_parts where (int_id > -3025 and int_id < 11976) and (int_id > -5 and int_id < 6002) and (int_id > 3060 and int_id < 6002);
