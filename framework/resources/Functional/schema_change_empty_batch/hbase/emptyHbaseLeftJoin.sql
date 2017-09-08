select t.data.partkey, t1.data.ps_partkey from schema_change_empty_batch_empty as t LEFT JOIN schema_change_empty_batch_partsupp as t1 ON t.data.partkey = t1.data.ps_partkey;
