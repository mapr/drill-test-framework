set `planner.slice_target`=1;
select ps_partkey, count(*) as numSuppliers from `json/partsupp` group by ps_partkey order by ps_partkey limit 5;
reset `planner.slice_target`;
