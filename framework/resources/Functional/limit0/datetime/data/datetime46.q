select cast(c_row as int), date_part('day', cast(c_timestamp as timestamp)) from basic;
