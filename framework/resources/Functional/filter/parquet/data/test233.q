--keep partition 1, 2, 3, 5.  Count is 9.
select count(*) from orders_parts where int_id in (-3025, -3024, -3023, -5, -4, 3060, 3061, 6001, 6002, 9025, 9026, 11975, 11976);
