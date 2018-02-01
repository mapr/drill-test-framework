-- keep partition 5
select count(*) from orders_parts where int_id > 10000 and int_id < 11001;
