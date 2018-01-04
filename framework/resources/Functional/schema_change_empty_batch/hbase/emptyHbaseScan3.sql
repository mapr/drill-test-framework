set `planner.slice_target`=1;
select DISTINCT cast(t.data.ps_partkey as varchar) as partkey from schema_change_empty_batch_partsupp t order by partkey limit 5;
reset `planner.slice_target`;
