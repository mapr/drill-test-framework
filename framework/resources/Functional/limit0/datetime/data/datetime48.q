select cast(c_row as int), date_part('year', cast(c_timestamp as timestamp)) from basic;
