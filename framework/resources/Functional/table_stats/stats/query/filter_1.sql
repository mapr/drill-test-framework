-- This is a simple equality filter
set `planner.statistics.use` = true;
explain plan including all attributes for select p_partkey from `table_stats/Tpch0.01/parquet/part` where p_size = 41;
reset `planner.statistics.use`;