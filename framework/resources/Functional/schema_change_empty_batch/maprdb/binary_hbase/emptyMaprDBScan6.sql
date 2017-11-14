set `planner.slice_target`=1;
select DISTINCT t.data.col from `/drill/testdata/schema_change_empty_batch/maprdb/binary/empty` as t;
reset `planner.slice_target`;
