select O_ORDERKEY,O_CUSTKEY,O_CLERK,O_COMMENT,dir0 from `/drill/testdata/partition_pruning/dfs/orders` where (dir0=1993);
