set `planner.slice_target`=1;
select DISTINCT t.data.p_brand from `/drill/testdata/schema_change_empty_batch/maprdb/binary/part` as t order by t.data.p_brand limit 5;
reset `planner.slice_target`;
