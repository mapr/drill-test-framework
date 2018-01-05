set planner.slice_target = 1;
--@test
select * from cp.`tpch/nation.parquet` where n_nationkey in (1, 2) order by n_nationkey desc;
reset planner.slice_target;