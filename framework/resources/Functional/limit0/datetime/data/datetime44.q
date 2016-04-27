select cast(c_row as int), date_part('minute', cast(c_timestamp as timestamp)) from basic;
