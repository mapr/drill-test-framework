-- keep partitions 1 and 5
explain plan for select count(*) from orders_parts where bigint_id < -2024 or bigint_id > 10975;
