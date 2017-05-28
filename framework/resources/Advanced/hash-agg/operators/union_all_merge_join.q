-- Takes around ~50 mins
-- One of the hash-aggs got 22MB memory and 2 out of 2 partitions spilled with a spill cycle of 2
-- One of the hash-aggs also got 22MB memory and 2 out of 2 partitions spilled with a spill cycle of 1
-- There was no spilling on one hash-agg which got 18MB of memory
alter session set `planner.width.max_per_node` = 2;
alter session set `planner.width.max_per_query` = 2;
alter session set `planner.memory.max_query_memory_per_node` = 607483648;
alter session set `planner.enable_hashjoin` = false;
use dfs.tpcds_sf1000_parquet_views;
select count(*) from (select count(distinct ss_net_profit) sales from store_sales union all
select count(distinct cs_net_paid_inc_tax) sales from catalog_sales) d1
inner join 
(select count(distinct ws_net_paid_inc_ship_tax) sales from web_sales) d2
on d1.sales = d2.sales;
use dfs;
alter session set `planner.enable_hashjoin` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
