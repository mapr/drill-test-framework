explain plan for select count(*) from dfs.`/drill/testdata/partition_pruning/hive/parquet/dynamic_lineitem_hierarchical_intstring` where dir0='year=1997' and coalesce(l_shipmode, 'TRUCK') = 'TRUCK';
