set `planner.enable_semijoin` = true;
select lineitem.l_linenumber,lineitem.l_orderkey,lineitem.l_linestatus from lineitem where lineitem.l_orderkey in (select o_orderkey from (select * from orders where orders.o_custkey in (select customer.c_custkey from customer)) orders1 ) order by  lineitem.l_linenumber,lineitem.l_orderkey,lineitem.l_linestatus limit 10;
reset `planner.enable_semijoin`;
