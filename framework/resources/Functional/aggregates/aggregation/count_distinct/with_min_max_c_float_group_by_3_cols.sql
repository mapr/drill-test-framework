select count(distinct c_float), max(c_float), min(c_float) from alltypes_with_nulls group by  c_date,c_time,c_timestamp order by  c_date,c_time,c_timestamp;
