set `planner.slice_target`=1;
select * from schema_change_empty_batch_empty;
reset `planner.slice_target`;
