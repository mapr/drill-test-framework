 select O_ORDERKEY,O_CUSTKEY,O_CLERK,O_COMMENT from `/drill/testdata/partition_pruning/dfs/orders` where (dir0 IN (1993) and o_orderkey>19500) or dir0 IN (1994);
