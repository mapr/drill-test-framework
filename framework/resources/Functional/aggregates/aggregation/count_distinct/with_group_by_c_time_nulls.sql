select c_time, COUNT(DISTINCT c_integer) from alltypes_with_nulls group by c_time order by c_time;
