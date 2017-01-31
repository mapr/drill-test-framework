-- keep null partition.  count is 11976.
select count(*) from orders_parts where int_id is not null;
