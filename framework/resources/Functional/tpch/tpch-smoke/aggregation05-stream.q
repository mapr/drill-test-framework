alter session set `planner.enable_hashagg` = false;
select count(distinct ps.ps_suppkey) as supplier_cnt 
  from partsupp ps;
alter session set `planner.enable_hashagg` = true;
