set `planner.slice_target`=1;
select DISTINCT p_partkey from `json/part_small` order by p_partkey;
reset `planner.slice_target`;
