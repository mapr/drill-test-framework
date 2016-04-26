select cast(c_row as int), extract(year from cast(c_timestamp as timestamp)) from basic;
