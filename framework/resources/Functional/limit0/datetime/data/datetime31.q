select cast(c_row as int), extract(day from cast(c_timestamp as timestamp)) from basic;
