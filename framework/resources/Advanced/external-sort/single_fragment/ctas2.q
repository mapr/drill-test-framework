alter session set `planner.width.max_per_node` = 1;
alter session set `planner.enable_decimal_data_type` = true;
alter session set `planner.memory.max_query_memory_per_node` = 104857600;
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.filter.min_selectivity_estimate_factor` = 1.0;
create table dfs.drillTestDir.xsort_ctas2 partition by (c_first_name) as
  select d1.c_first_name, d1.c_last_name, d1.c_email_address from (
    select d.*, concat(d.c_first_name, d.c_last_name) as name from (
      SELECT
            *
      FROM   catalog_sales,
           customer
      WHERE  cs_bill_customer_sk = c_customer_sk
    ) as d
    order by d.c_email_address nulls first
  ) as d1
  where d1.name is not null;
select count(*) from dfs.drillTestDir.xsort_ctas2;
drop table dfs.drillTestDir.xsort_ctas2;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.enable_decimal_data_type` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
