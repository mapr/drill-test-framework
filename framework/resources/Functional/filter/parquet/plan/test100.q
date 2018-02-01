-- keep partition 1.  count is 7.
explain plan for select * from orders_parts where (int_id = -3000) or (bigint_id = -2999) or (float_id = -2998.0) or (double_id = -2997.0) or (date_id = '2008-07-21') or (timestamp_id = '2016-09-30 21:21:12.873') or (time_id = '00:27:21.873');
