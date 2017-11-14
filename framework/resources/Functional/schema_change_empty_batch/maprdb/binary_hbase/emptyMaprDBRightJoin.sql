set `planner.slice_target`=1;
select p.data.p_partkey, ps.ps_partkey from `/drill/testdata/schema_change_empty_batch/maprdb/binary/part` as p RIGHT JOIN (select t.data.ps_partkey as ps_partkey from `/drill/testdata/schema_change_empty_batch/maprdb/binary/partsupp` as t where t.data.ps_partkey>320000) as ps ON p.data.p_partkey = ps.ps_partkey;
reset `planner.slice_target`;
