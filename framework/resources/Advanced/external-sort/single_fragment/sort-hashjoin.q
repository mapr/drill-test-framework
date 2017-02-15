-- multiple order by's in a single query
-- feed the output of order by into hash-join
-- mix of spill and non-spill cases for the order by
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.enable_decimal_data_type` = true;
alter session set `planner.memory.max_query_memory_per_node` = 1004857600;
alter session set `planner.disable_exchanges` = true;
select count(*) from 
(
  select * from customer_demographics order by cd_marital_status
) as d1, 
(
  select * from store_sales order by ss_ext_list_price 
) as d2,
(
  select * from customer order by c_email_address
) as d3 
where 
  d1.cd_demo_sk = d3.c_current_cdemo_sk
  and d2.ss_customer_sk = d3.c_customer_sk;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.enable_decimal_data_type` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.disable_exchanges` = false;
