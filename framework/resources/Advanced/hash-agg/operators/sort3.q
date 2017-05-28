use dfs.tpcds_sf1_parquet_views;
alter session set `planner.memory.max_query_memory_per_node` = 10004857600;
alter session set `planner.enable_mergejoin` = false;
select * from (
select 
min(s_closed_date_sk) sk, count(distinct s_market_manager) cnt_manager, avg(ss_ext_tax*s_tax_precentage), sum(ss_ext_wholesale_cost) sum_ss_cost
from store_sales, store
where store.s_store_sk = store_sales.ss_store_sk
group by store_sales.ss_customer_sk, store_sales.ss_item_sk, store_sales.ss_cdemo_sk, store.s_hours 
having count(distinct s_market_manager) <> 1
union all 
select max(cs_ship_date_sk) sk, min(cs_ext_list_price), avg(cs_net_profit), sum(cs_net_paid_inc_ship_tax) from catalog_sales where cs_ext_discount_amt < 1000.0 group by cs_sold_date_sk, cs_ext_list_price, cs_net_paid
) d
where d.sum_ss_cost is null;
use dfs;
alter session set `planner.enable_mergejoin` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
