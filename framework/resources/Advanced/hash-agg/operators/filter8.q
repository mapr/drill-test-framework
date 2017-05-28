-- 16 out of 16 partitions spilled in 17 fragments and spill cycle is 1. Took ~30 mins on a single node cluster
alter session set `planner.memory.max_query_memory_per_node` = 10327127360;
alter session set `planner.width.max_per_query` = 17;
use dfs.tpcds_sf1000_parquet_views;
select * from (select max(cs_sold_time_sk) max_sk, cs_sold_date_sk, cs_ext_list_price, cs_net_paid from catalog_sales where cs_ext_discount_amt < 1000.0 group by cs_sold_date_sk, cs_ext_list_price, cs_net_paid) d where d.max_sk < 10;
use dfs;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_query` = 1000;
