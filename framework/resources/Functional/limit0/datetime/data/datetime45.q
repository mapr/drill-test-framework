select cast(c_row as integer), date_part('hour', cast(c_timestamp as timestamp)) from basic;
