alter session set `planner.slice_target` = 1;
select count(*) from cp.`tpch/orders.parquet` having count(distinct o_orderkey) <= 10000000.00;
alter session set `planner.slice_target` = 100000;
