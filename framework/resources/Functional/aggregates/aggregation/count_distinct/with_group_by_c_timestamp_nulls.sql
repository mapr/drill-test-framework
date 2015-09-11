select c_timestamp, COUNT(DISTINCT c_integer) from alltypes_with_nulls group by c_timestamp order by c_timestamp;
