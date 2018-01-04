set `planner.slice_target`=1;
select DISTINCT t.p_brand from `maprdb/json/part` as t order by t.p_brand limit 5;
reset `planner.slice_target`;
