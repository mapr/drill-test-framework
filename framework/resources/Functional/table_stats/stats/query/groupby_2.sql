-- This group by is on a groupby key where there are many duplicates
set `planner.statistics.use` = true;
explain plan including all attributes for select c_mktsegment,count(*) from `table_stats/Tpch0.01/parquet/customer` group by c_mktsegment;
reset `planner.statistics.use`;