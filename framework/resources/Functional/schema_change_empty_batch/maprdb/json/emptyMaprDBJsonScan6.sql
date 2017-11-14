set `planner.slice_target`=1;
select DISTINCT t.p_partkey from `maprdb/json/empty` as t;
reset `planner.slice_target`;
