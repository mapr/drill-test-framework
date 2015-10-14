select c_row, extract(minute from cast(c_timestamp as timestamp)) from basic;
