alter session set `planner.slice_target` = 1;
explain plan for select * from (select count(*) from cp.`tpch/orders.parquet` having count(distinct cast(o_orderkey as integer)) <= 10000000.00) t limit 0;
alter session set `planner.slice_target` = 100000;
