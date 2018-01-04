set `planner.slice_target`=1;
select DISTINCT ps_suppkey from `json/partsupp` order by ps_suppkey limit 5;
reset `planner.slice_target`;
