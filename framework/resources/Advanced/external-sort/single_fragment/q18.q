ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.disable_exchanges` = true;
alter session set `planner.enable_hashjoin` = false;
use dfs.concurrency;
select count(*) from
        dfs.concurrency.customer_nocompression_256_filtered c,
        dfs.concurrency.orders_nocompression_256 o,
        dfs.concurrency.lineitem_nocompression_256 l
    where
        c.c_custkey = o.o_custkey
        and l.l_orderkey = o.o_orderkey;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.disable_exchanges` = false;
alter session set `planner.enable_hashjoin` = true;
use dfs.tpcds_sf1_parquet_views;
