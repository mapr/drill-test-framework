-- 2 out of 2 partitions spilled and spill cycle is 3. Each hash agg minor fragment of second phase got 15MB of memory
alter session set `planner.width.max_per_node` = 2;
alter session set `planner.width.max_per_query` = 2;
alter session set `planner.memory.max_query_memory_per_node` = 107483648;
use dfs.tpcds_sf1000_parquet_views;
select count(distinct ws_net_paid_inc_ship_tax) from web_sales;
use dfs;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
