-- This group by is on a groupby key where all the values are distinct
set `planner.statistics.use` = true;
explain plan including all attributes for select c_custkey from `table_stats/Tpch0.01/parquet/customer` group by c_custkey;
reset `planner.statistics.use`;