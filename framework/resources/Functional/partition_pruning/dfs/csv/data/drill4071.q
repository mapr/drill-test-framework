select count(*) from dfs_test.`/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring` where dir0='1997' and coalesce(columns[14], 'TRUCK') = 'TRUCK';
