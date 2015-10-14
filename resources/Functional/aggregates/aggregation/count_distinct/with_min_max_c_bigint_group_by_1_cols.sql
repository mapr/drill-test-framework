select count(distinct c_bigint), max(c_bigint), min(c_bigint) from alltypes_with_nulls group by  c_date order by  c_date;
