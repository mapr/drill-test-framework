select count(distinct c_bigint), max(c_bigint), min(c_bigint) from alltypes_with_nulls group by  c_date,c_time,c_timestamp,c_boolean,c_varchar,c_integer,c_bigint,d9 order by  c_date,c_time,c_timestamp,c_boolean,c_varchar,c_integer,c_bigint,d9;
