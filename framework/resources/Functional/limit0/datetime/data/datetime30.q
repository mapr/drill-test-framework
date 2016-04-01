select cast(c_row as integer), extract(hour from cast(c_timestamp as timestamp)) from basic;
