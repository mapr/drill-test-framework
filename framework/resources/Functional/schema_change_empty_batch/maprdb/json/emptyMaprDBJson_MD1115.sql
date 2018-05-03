set `planner.slice_target`=1;
select t.ps_partkey, CAST(sum(t.ps_supplycost) as DECIMAL(6,2)) as numSuppliers from `maprdb/json/partsupp1` as t where t.ps_partkey > 3 AND t.ps_partkey < 6 group by t.ps_partkey;
reset `planner.slice_target`;
