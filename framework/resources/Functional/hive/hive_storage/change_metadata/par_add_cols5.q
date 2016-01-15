select o_orderkey,o_custkey, o_orderdate, o_orderpriority, o_clerk, o_shippriority, o_comment, `year` from hive.changemetadata_orders_partitioned1 where `year` = 1990 order by o_orderkey limit 2;
