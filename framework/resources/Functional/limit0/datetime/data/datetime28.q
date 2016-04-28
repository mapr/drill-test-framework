select cast(c_row as int), extract(Second from cast(c_timestamp as timestamp)) from basic;
