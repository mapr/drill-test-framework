select columns[0], columns[1], columns[4], columns[10], columns[13] from `/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring` where dir0 = abs(-1993) and dir1='feb';
