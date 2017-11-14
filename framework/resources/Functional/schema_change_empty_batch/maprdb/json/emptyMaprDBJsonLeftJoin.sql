set `planner.slice_target`=1;
select t.partkey, t1.ps_partkey from `maprdb/json/empty` as t LEFT JOIN `maprdb/json/partsupp` as t1 ON t.partkey = t1.ps_suppkey;
reset `planner.slice_target`;
