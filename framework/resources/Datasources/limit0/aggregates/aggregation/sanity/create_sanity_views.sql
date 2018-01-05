create or replace view `dfs_test.aggregation`.t1_v as select cast(a1 as int) a1,cast(b1 as char(5)) b1, cast(c1 as date) as c1 from `dfs_test.aggregation`.t1;

create or replace view `dfs_test.aggregation`.t2_v as select cast(a2 as int) a2, cast(b2 as character varying(5)) b2,cast(c2 as date) c2 from `dfs_test.aggregation`.t2;

create or replace view `dfs_test.aggregation`.t3_v as select cast(a3 as integer) a3,cast(b3 as varchar(5)) b3,cast(c3 as date) c3 from `dfs_test.aggregation`.t3;
