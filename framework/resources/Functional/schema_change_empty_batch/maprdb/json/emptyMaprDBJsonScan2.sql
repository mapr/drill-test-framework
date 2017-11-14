set `planner.slice_target`=1;
select t.p_partkey from `maprdb/json/part` as t order by t.p_name limit 5;
reset `planner.slice_target`;
