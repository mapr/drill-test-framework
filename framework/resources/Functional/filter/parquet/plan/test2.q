-- keep partition 2
explain plan for select count(*) from orders_parts where int_id > 10 and int_id < 1011;
