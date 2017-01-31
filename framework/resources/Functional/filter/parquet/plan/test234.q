--keep partition 1, 2, 3, 5.  Count is 6.
explain plan for select count(*) from orders_parts where int_id in (-5, -4) or bigint_id in (3060) or float_id in (3061) or double_id in (6001) or date_id in ('2042-10-07');
