select count(distinct c_integer), max(c_integer), min(c_integer) from alltypes_with_nulls group by  c_date,c_time order by  c_date,c_time;
