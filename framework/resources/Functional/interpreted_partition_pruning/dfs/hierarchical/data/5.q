select count(*) from `/drill/testdata/partition_pruning/dfs/lineitempart` where case when dir0=1991 then null else 1 end is null or dir0=1992;
