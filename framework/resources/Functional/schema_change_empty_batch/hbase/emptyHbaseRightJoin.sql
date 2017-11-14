set `planner.slice_target`=1;
select p.data.p_partkey, ps.ps_partkey from schema_change_empty_batch_part as p RIGHT JOIN (select t.data.ps_partkey as ps_partkey from schema_change_empty_batch_partsupp as t where t.data.ps_partkey>32000) as ps ON p.data.p_partkey = ps.ps_partkey;
reset `planner.slice_target`;
