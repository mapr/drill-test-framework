explain plan for select count(*) from dfs_test.`/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring` where dir0='1997' and coalesce(l_shipmode, 'TRUCK') = 'TRUCK';
