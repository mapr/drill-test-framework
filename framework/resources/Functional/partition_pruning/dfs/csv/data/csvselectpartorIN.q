select columns[0],columns[1],columns[4],columns[10],columns[13] from `/drill/testdata/partition_pruning/dfs/lineitempart` where (dir0 IN (1993) and columns[0]>29600) or dir0 IN (1994);
