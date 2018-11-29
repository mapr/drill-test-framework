set `planner.enable_semijoin` = true;
select * from orders where orders.o_custkey in (select customer.c_custkey from customer) order by O_ORDERKEY,O_CUSTKEY,O_ORDERSTATUS,o_totalprice,O_ORDERDATE,O_ORDERPRIORITY,O_CLERK,O_SHIPPRIORITY,O_COMMENT limit 10;
reset `planner.enable_semijoin`;
