alter session set `planner.enable_mergejoin` = false;
select o.O_TOTALPRICE, l.L_ORDERKEY
   from orders o, lineitem l
   where o.O_ORDERKEY = l.L_ORDERKEY and o.O_TOTALPRICE > 500000.00
   order by o.O_TOTALPRICE;
alter session set `planner.enable_mergejoin` = true;
