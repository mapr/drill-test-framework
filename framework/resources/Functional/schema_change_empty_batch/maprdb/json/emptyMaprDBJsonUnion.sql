set `planner.slice_target`=1;
select p.p_partkey, ps.ps_suppkey from (select p_partkey, p_name, p_mfgr from `maprdb/json/part` where p_size = 98 UNION select p_partkey, p_name, p_mfgr from `maprdb/json/part` where p_size = 99) as p, `maprdb/json/partsupp` as ps where p.p_partkey = ps.ps_partkey;
reset `planner.slice_target`;
