select count(distinct c_bigint), max(c_bigint), min(c_bigint) from alltypes_with_nulls_v group by  c_date,c_time order by  c_date,c_time;
