ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.enable_decimal_data_type` = true;
alter session set `planner.memory.max_query_memory_per_node` = 304857600;
select * from (select *, ss_sold_date_sk + ss_sold_time_sk as sumcol1, ss_item_sk + ss_customer_sk as sumcol2 from (select
cast( ss_sold_date_sk as integer)  as ss_sold_date_sk,
cast( ss_sold_time_sk as integer)  as ss_sold_time_sk,
cast( ss_item_sk as integer)  as ss_item_sk,
cast( ss_customer_sk as integer)  as ss_customer_sk,
cast( ss_cdemo_sk as integer)  as ss_cdemo_sk,
cast( ss_hdemo_sk as integer)  as ss_hdemo_sk,
cast( ss_addr_sk as integer)  as ss_addr_sk,
cast( ss_store_sk as integer)  as ss_store_sk,
cast( ss_promo_sk as integer)  as ss_promo_sk,
cast( ss_ticket_number as integer)  as ss_ticket_number,
cast( ss_quantity as integer)  as ss_quantity,
cast( ss_wholesale_cost as double)  as ss_wholesale_cost,
cast( ss_list_price as double)  as ss_list_price,
cast( ss_sales_price as double)  as ss_sales_price,
cast( ss_ext_discount_amt as double)  as ss_ext_discount_amt,
cast( ss_ext_sales_price as double)  as ss_ext_sales_price,
cast( ss_ext_wholesale_cost as double)  as ss_ext_wholesale_cost,
cast( ss_ext_list_price as double)  as ss_ext_list_price,
cast( ss_ext_tax as double)  as ss_ext_tax,
cast( ss_coupon_amt as double)  as ss_coupon_amt,
cast( ss_net_paid as double)  as ss_net_paid,
cast( ss_net_paid_inc_tax as double)  as ss_net_paid_inc_tax,
cast( ss_net_profit as double)  as ss_net_profit
from `../store_sales/1_0_0.parquet`
union all 
select
cast( ss_sold_date_sk as integer)  as ss_sold_date_sk,
cast( ss_sold_time_sk as integer)  as ss_sold_time_sk,
cast( ss_item_sk as integer)  as ss_item_sk,
cast( ss_customer_sk as integer)  as ss_customer_sk,
cast( ss_cdemo_sk as integer)  as ss_cdemo_sk,
cast( ss_hdemo_sk as integer)  as ss_hdemo_sk,
cast( ss_addr_sk as integer)  as ss_addr_sk,
cast( ss_store_sk as integer)  as ss_store_sk,
cast( ss_promo_sk as integer)  as ss_promo_sk,
cast( ss_ticket_number as integer)  as ss_ticket_number,
cast( ss_quantity as integer)  as ss_quantity,
cast( ss_wholesale_cost as double)  as ss_wholesale_cost,
cast( ss_list_price as double)  as ss_list_price,
cast( ss_sales_price as double)  as ss_sales_price,
cast( ss_ext_discount_amt as double)  as ss_ext_discount_amt,
cast( ss_ext_sales_price as double)  as ss_ext_sales_price,
cast( ss_ext_wholesale_cost as double)  as ss_ext_wholesale_cost,
cast( ss_ext_list_price as double)  as ss_ext_list_price,
cast( ss_ext_tax as double)  as ss_ext_tax,
cast( ss_coupon_amt as double)  as ss_coupon_amt,
cast( ss_net_paid as double)  as ss_net_paid,
cast( ss_net_paid_inc_tax as double)  as ss_net_paid_inc_tax,
cast( ss_net_profit as double)  as ss_net_profit
from `../store_sales/1_1_0.parquet`
) d order by d.ss_sold_date_sk, ss_net_profit) d1 where sumcol1 is null and sumcol2 > 100000;
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.enable_decimal_data_type` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_query` = 1000;
