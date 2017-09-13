select count (*) from (
  select t1.l_orderkey, t1.dir0, t1.l_linenumber, t2.l_linenumber from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` t1
  join dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` t2 on t1.l_orderkey = t2.l_orderkey 
  where t2.dir0 = 1 and t2.dir1='two' and t2.dir2 = '2015-8-12'
    and t1.dir0 = 1 and t1.dir1='one' and t1.dir2 = '2015-7-12'
) data;
