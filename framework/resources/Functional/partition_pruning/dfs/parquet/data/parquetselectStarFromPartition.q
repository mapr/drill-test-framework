select * from `/drill/testdata/partition_pruning/dfs/orders` where (dir0=1993 and O_TOTALPRICE>40000) or (dir0=1994 and O_TOTALPRICE>40000);
