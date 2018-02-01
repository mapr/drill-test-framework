--keep partition 5.  Count is 1.
explain plan for select count(*) from orders_parts where int_id in (9026) and bigint_id in (9026) and float_id in (9026) and double_id in (9026) and date_id in ('2041-06-20') and timestamp_id in ('2016-10-09 05:42:38.986') and time_id in ('03:49:40.827');
