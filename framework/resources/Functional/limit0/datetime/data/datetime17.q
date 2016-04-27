select cast(c_row as integer), extract(minute from cast(c_date as date)) from basic;
