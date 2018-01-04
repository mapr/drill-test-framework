set `planner.slice_target`=1;
select * from `/drill/testdata/schema_change_empty_batch/maprdb/binary/empty`;
reset `planner.slice_target`;
