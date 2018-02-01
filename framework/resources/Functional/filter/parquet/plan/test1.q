-- keep partition 1
explain plan for select count(*) from orders_parts where int_id <= -2025;
