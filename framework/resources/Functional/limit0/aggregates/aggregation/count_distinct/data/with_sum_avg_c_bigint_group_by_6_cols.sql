select count(distinct c_bigint), sum(c_bigint), round(avg(c_bigint)) from alltypes_with_nulls_v group by  c_varchar,c_integer,c_bigint,d9,d18,d28 order by  c_varchar,c_integer,c_bigint,d9,d18,d28;
