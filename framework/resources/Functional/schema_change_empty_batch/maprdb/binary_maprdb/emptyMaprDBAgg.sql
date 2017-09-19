select t.data.ps_partkey, count(*) as numSuppliers from `maprdb/binary/partsupp` as t group by t.data.ps_partkey order by t.data.ps_partkey limit 5;
