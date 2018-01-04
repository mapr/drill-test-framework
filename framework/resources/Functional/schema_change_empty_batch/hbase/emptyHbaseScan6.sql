set `planner.slice_target`=1;
select DISTINCT t.data.col1 from schema_change_empty_batch_empty t;
reset `planner.slice_target`;
