select cast(c_row as integer), date_part('month', cast(c_timestamp as timestamp)) from basic;
