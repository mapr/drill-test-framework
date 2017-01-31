-- keep partition 5
explain plan for select count(*) from orders_parts where int_id > 10975;
