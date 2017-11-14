set `planner.slice_target`=1;
select t.partkey, t1.ps_partkey from `json/empty` as t LEFT JOIN `json/partsupp` as t1 ON t.partkey = t1.ps_partkey;
reset `planner.slice_target`;
