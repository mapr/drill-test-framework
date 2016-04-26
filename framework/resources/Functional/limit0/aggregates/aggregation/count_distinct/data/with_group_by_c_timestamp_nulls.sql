select c_timestamp, COUNT(DISTINCT c_integer) from alltypes_with_nulls_v group by c_timestamp order by c_timestamp;
