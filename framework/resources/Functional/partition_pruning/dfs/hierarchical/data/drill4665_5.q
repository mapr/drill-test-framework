select columns[0], columns[1], columns[4], columns[10], columns[13] from dfs_test.`/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring` where dir0=1993 and dir1='nov' and columns[13] like '%ERS%' and abs(columns[0]+1) like '2960%';
