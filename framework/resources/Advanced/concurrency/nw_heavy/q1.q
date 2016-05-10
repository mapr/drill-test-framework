select count(*) from
        dfs.concurrency.customer_nocompression_256_filtered c,
        dfs.concurrency.orders_nocompression_256 o,
        dfs.concurrency.lineitem_nocompression_256 l
    where
        c.c_custkey = o.o_custkey
        and l.l_orderkey = o.o_orderkey;
