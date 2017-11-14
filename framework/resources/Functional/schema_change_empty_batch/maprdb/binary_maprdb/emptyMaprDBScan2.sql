set `planner.slice_target`=1;
select t.data.p_partkey from `maprdb/binary/part` as t order by t.data.p_partkey limit 5;
reset `planner.slice_target`;
