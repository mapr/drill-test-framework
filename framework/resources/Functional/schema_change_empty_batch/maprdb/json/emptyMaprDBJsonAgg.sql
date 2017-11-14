set `planner.slice_target`=1;
select t.ps_partkey, count(*) as numSuppliers from `maprdb/json/partsupp` as t group by t.ps_partkey order by t.ps_partkey limit 5;
reset `planner.slice_target`;
