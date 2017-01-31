-- keep partitions 1 and 3
explain plan for select count(*) from orders_parts where bigint_id < -2024 or (bigint_id > 4000 and bigint_id < 5001);
