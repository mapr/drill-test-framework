select cast(c_row as integer), extract(Hour from cast(c_time as time)) from basic;
