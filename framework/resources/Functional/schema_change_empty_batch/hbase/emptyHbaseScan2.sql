set `planner.slice_target`=1;
select cast(t.data.p_partkey as varchar) from schema_change_empty_batch_part t order by t.data.p_partkey limit 5;
reset `planner.slice_target`;
