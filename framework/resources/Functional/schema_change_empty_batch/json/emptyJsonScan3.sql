set `planner.slice_target`=1;
select * from `json/partsupp` order by ps_partkey, ps_availqty limit 4;
reset `planner.slice_target`;
