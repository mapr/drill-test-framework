select count (*) from 
  (select l_orderkey, dir0, dir1, dir2, l_linenumber from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` where dir0 = 1 and dir1='one' and dir2 = '2015-7-12') t1
  inner join  
  (select l_orderkey, dir0, dir1, dir2,l_linenumber from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` where dir0 = 1 and dir1 = 'two' and dir2 = '2015-8-12') t2
  on t1.l_orderkey = t2.l_orderkey
