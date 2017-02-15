ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 8589934592;
alter session set `planner.enable_decimal_data_type` = true;
select * from dfs.`/drill/testdata/tpcds/parquet/sf1000/catalog_sales` order by cs_quantity, cs_wholesale_cost limit 1;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.enable_decimal_data_type` = false;
