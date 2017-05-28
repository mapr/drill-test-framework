-- 2 out of 2 partitions spilled in all 7 minor fragments in one of the hash-agg. Each minor fragment received ~28MB and the spill cycle is 4
-- 1 out of 2 partitions spilled in all 7 minor fragments in the other hash-agg. Each minor fragment received ~30MB and the spill cycle is 1
-- ~46 MB is given to all 17 minor fragments in one sort operator and the spill count is 5
-- query takes ~8 minutes
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 5607483648;
alter session set `planner.enable_hashjoin` = false;
select * from (
  select columns[0] col1 from dfs.`/drill/testdata/hash-agg/seq/seqaa.tbl` 
  order by columns[0]
) d1 
inner join (
  select distinct columns[0] col2 from dfs.`/drill/testdata/hash-agg/uuid.tbl`
  union all 
  select max(dir0) col2 from dfs.`/drill/testdata/resource-manager/small_large_parquet` group by col1
) d2 
on d1.col1 = d2.col2;
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.enable_hashjoin` = true;
