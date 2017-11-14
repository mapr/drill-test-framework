set `planner.slice_target`=1;
select t.p_partkey, t1.ps_suppkey from `json/part` as t RIGHT JOIN `json/partsupp` as t1 ON t.p_partkey = t1.ps_partkey where t1.ps_partkey>25000;
reset `planner.slice_target`;
