select count (*) from (
  select l_orderkey, dir0 from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level` t1 where t1.dir0 = 1 and t1.dir1='one' and t1.dir2 = '2015-7-12'
  union all 
  select l_orderkey, dir0 from dfs_test.`/drill/testdata/partition_pruning/nested/l_3level/1/two/2015-8-12` t2 ) data;
