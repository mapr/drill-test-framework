alter session set `planner.enable_mergejoin` = false;
select p.p_partkey 
   from part p, partsupp ps 
   where p.p_partkey = ps.ps_partkey 
              and p.p_size = 41  
order by p.p_partkey
limit 20;
alter session set `planner.enable_mergejoin` = true;
