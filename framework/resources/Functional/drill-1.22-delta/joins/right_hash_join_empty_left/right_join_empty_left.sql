-- expected: tpch region has 5 rows (keys 0-4); left side filtered to 0 rows -> 5 rows, n_name NULL
alter session set `planner.enable_mergejoin` = false;
alter session set `planner.enable_nestedloopjoin` = false;
alter session set `planner.enable_hashjoin` = true;
--@test
select r.r_regionkey, n.n_name from (select n_regionkey, n_name from cp.`tpch/nation.parquet` where n_nationkey > 1000) n right join cp.`tpch/region.parquet` r on n.n_regionkey = r.r_regionkey;
alter session reset `planner.enable_mergejoin`;
alter session reset `planner.enable_nestedloopjoin`;
alter session reset `planner.enable_hashjoin`
