select count (*) from (
  select l_orderkey, dir0 from dfs.`/drill/testdata/partition_pruning/nested/l_3level` t1 where t1.dir0 = 1 and t1.dir1='one' and t1.dir2 = '2015-7-12'
  union 
  select l_orderkey, dir0 from dfs.`/drill/testdata/partition_pruning/nested/l_3level` t2 where t2.dir0 = 1 and t2.dir1='two' and t2.dir2 = '2015-8-12') data;
