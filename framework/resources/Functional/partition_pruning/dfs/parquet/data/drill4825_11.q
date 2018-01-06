select count (*) from (
  select t1.l_orderkey, t1.l_linenumber from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` t1 
  where 
    t1.dir0 = 1 and t1.dir1='one' and t1.dir2 = '2015-7-12' and t1.l_orderkey in (
      select t2.l_orderkey from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` t2 where t2.dir0 = 1 and t2.dir1='two' and t2.dir2 = '2015-8-12' and t2.l_discount = t1.l_discount
    )
) data;
