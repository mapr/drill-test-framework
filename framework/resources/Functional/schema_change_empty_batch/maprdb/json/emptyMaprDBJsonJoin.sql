set `planner.slice_target`=1;
select t.partkey, t1.ps_partkey from `maprdb/json/empty` as t JOIN (select ps_partkey from `maprdb/json/partsupp` where ps_partkey > 1000000) as t1 ON t.partkey = t1.ps_partkey;
reset `planner.slice_target`;
