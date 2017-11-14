set `planner.slice_target`=1;
select DISTINCT t.data.col from `maprdb/binary/empty` as t;
reset `planner.slice_target`;
