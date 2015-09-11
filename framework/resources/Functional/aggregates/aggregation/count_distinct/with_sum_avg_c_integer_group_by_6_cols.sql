select count(distinct c_integer), sum(c_integer), round(avg(c_integer)) from alltypes_with_nulls group by  c_varchar,c_integer,c_bigint,d9,d18,d28 order by  c_varchar,c_integer,c_bigint,d9,d18,d28;
