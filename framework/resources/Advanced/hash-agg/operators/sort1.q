alter session set `planner.memory.max_query_memory_per_node` = 5004857600;
alter session set `planner.width.max_per_query` = 17;
use dfs.tpcds_sf1_parquet_views;
select * from (
select 
max(s_store_id) m_sid, min(s_rec_start_date) min_start_date, count(distinct s_market_manager) cnt_manager, avg(ss_ext_tax*s_tax_precentage), sum(ss_ext_wholesale_cost) sum_ss_cost
from store_sales, store
where store.s_store_sk = store_sales.ss_store_sk
group by store_sales.ss_customer_sk, store_sales.ss_item_sk, store_sales.ss_cdemo_sk, store.s_hours
) d where d.sum_ss_cost is null;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_query` = 1000;
use dfs;
