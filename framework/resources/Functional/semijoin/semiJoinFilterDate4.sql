set `planner.enable_semijoin` = true;
select lineitem.l_quantity from lineitem where lineitem.l_orderkey in (select orders.o_orderkey from orders where o_orderdate > date '1993-01-02') order by lineitem.l_quantity limit 10;
reset `planner.enable_semijoin`;
