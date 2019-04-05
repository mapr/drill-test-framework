-- This is a simple inner join on the same table.
set `planner.statistics.use` = true;
explain plan including all attributes for select count(*)  from `table_stats/Tpch0.01/parquet/part` p1, `table_stats/Tpch0.01/parquet/part` p2 where p1.p_mfgr = p2.p_mfgr;
reset `planner.statistics.use`;