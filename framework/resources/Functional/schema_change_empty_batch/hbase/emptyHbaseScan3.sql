select DISTINCT cast(t.data.ps_partkey as varchar) as partkey from schema_change_empty_batch_partsupp t order by partkey limit 5;
