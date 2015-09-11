select c_row, extract(hour from cast(c_timestamp as timestamp)) from basic;
