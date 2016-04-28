select cast(c_row as integer), date_part('second', cast(c_timestamp as timestamp)) from basic;
