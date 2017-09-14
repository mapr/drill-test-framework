alter session set `planner.enable_broadcast_join`=false;
select * from hbase.customer1 c, cp.`tpch/orders.parquet` o where cast(c.orders.id as bigint) = o.o_orderkey and c.orders.id <= '200';
alter session set `planner.enable_broadcast_join`=true; 
