alter session set `planner.slice_target` = 1;
select count(*) from cp.`tpch/orders.parquet` having count(distinct cast(o_orderkey as integer)) <= 10000000.00;
alter session set `planner.slice_target` = 100000;
