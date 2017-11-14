set `planner.slice_target`=1;
select t.data.ps_partkey, count(*) as numSuppliers from `/drill/testdata/schema_change_empty_batch/maprdb/binary/partsupp` as t group by t.data.ps_partkey order by t.data.ps_partkey limit 5;
reset `planner.slice_target`;
