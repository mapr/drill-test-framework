-- This is a simple inner join + equality filter
set `planner.statistics.use` = true;
explain plan including all attributes for select p.p_partkey from `table_stats/Tpch0.01/parquet/part` p, `table_stats/Tpch0.01/parquet/partsupp` ps where p.p_partkey = ps.ps_partkey and p.p_size = 41;
reset `planner.statistics.use`;