use dfs_test;
select t1.c_row, t1.c_groupby, t2.c_int, t2.c_bigint from `/drill/testdata/impersonation/t1.parquet` t1, `/drill/testdata/impersonation/t2.parquet` t2 where t1.c_row = t2.c_int;
use dfs_test;
