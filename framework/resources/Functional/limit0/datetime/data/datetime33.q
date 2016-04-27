select cast(c_row as int), extract(month from cast(c_timestamp as timestamp)) from basic;
