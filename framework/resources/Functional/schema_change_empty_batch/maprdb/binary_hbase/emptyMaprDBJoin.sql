set `planner.slice_target`=1;
select t.data.partkey, t1.ps_partkey from `/drill/testdata/schema_change_empty_batch/maprdb/binary/empty` as t JOIN (select ps.data.ps_partkey as ps_partkey from `/drill/testdata/schema_change_empty_batch/maprdb/binary/partsupp` as ps where ps.data.ps_partkey > 1000000) as t1 ON t.data.partkey = t1.ps_partkey;
reset `planner.slice_target`;
