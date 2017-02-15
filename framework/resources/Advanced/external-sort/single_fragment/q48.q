ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.disable_exchanges` = true;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 1052428800;
alter session set `planner.enable_decimal_data_type` = true;
select count(*) from (
  select * from dfs.`/drill/testdata/resource-manager/all_types_large` d1
  order by d1.map.missing, d1.missing12.x, d1.missing1, d1.missing2, d1.missing3, d1.missing4, 
    d1.missing5, d1.missing6, d1.missing7, d1.missing8, d1.missing9, d1.missing10, d1.missing11, 
    d1.missing12.x, d1.missing13, d1.missing14, d1.missing15, d1.missing16, d1.missing17, d1.missing18,
    d1.missing19, d1.missing20, d1.missing21, d1.missing22, d1.missing23, d1.missing24, d1.missing25, 
    d1.missing26, d1.missing27, d1.missing28, d1.`missing 29`, d1.missing30, d1.missing31, d1.missing32, 
    d1.missing33, d1.missing34, d1.m1 
) d where d.missing3 is false;
alter session set `planner.enable_decimal_data_type` = false;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.disable_exchanges` = false;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
