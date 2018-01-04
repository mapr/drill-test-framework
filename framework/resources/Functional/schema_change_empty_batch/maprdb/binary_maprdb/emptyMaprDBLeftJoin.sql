set `planner.slice_target`=1;
select t.data.partkey, t1.data.ps_partkey from `maprdb/binary/empty` as t LEFT JOIN `maprdb/binary/partsupp` as t1 ON t.data.partkey = t1.data.ps_partkey;
reset `planner.slice_target`;
