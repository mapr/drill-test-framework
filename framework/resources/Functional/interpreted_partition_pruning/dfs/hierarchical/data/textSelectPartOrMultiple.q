select columns[0], columns[1], columns[4], columns[10], columns[13] from `/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring` where (dir0=cast(round(1993.11) as integer) and dir1='oct') or (dir0=1994 and dir1='may');
