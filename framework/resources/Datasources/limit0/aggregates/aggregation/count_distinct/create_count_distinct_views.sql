create or replace view `dfs_test.aggregation`.alltypes_with_nulls_v as select cast(c_varchar as varchar(10)) c_varchar,cast(c_integer as int) c_integer,cast(c_bigint as bigint) c_bigint,cast(c_smalldecimal as double) c_smalldecimal,cast(c_bigdecimal as double precision) c_bigdecimal,cast(c_float as float) c_float,cast(c_date as date) c_date,cast(c_time as time) c_time,cast(c_timestamp as timestamp) c_timestamp,cast(c_boolean as boolean) c_boolean,cast(d9 as double) d9,cast(d18 as double) d18,cast(d28 as double) d28, cast(d38 as double) d38 from `dfs_test.aggregation`.alltypes_with_nulls;

create or replace view `dfs_test.aggregation`.alltypes_v as select cast(c_varchar as character varying(30)) c_varchar,cast(c_integer as int) c_integer,cast(c_bigint as bigint) c_bigint,cast(c_smalldecimal as double) c_smalldecimal,cast(c_bigdecimal as double precision) c_bigdecimal,cast(c_float as float) c_float,cast(c_date as date) c_date,cast(c_time as time) c_time,cast(c_timestamp as timestamp) c_timestamp,cast(c_boolean as boolean) c_boolean,cast(d9 as double) d9,cast(d18 as double) d18,cast(d28 as double) d28, cast(d38 as double) d38 from `dfs_test.aggregation`.alltypes;

create or replace view `dfs_test.aggregation`.t1_v as select cast(a1 as int) a1,cast(b1 as char(5)) b1, cast(c1 as date) as c1 from `dfs_test.aggregation`.t1;

create or replace view `dfs_test.aggregation`.t2_v as select cast(a2 as int) a2, cast(b2 as character varying(5)) b2,cast(c2 as date) c2 from `dfs_test.aggregation`.t2;

create or replace view `dfs_test.aggregation`.t3_v as select cast(a3 as integer) a3,cast(b3 as varchar(5)) b3,cast(c3 as date) c3 from `dfs_test.aggregation`.t3;
