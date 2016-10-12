alter session set `planner.enable_mergejoin` = false;
select o.O_TOTALPRICE
    from customer c, orders o
    where c.C_CUSTKEY = o.O_CUSTKEY;
alter session set `planner.enable_mergejoin` = true;
