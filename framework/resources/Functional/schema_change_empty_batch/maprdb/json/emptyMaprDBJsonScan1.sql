set `planner.slice_target`=1;
select * from `maprdb/json/part` as t order by t.p_partkey limit 5;
reset `planner.slice_target`;
