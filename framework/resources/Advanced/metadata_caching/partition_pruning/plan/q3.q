refresh table metadata dfs.`/drill/testdata/tpch100_dir_partitioned_50000files/lineitem`;
explain plan for select * from dfs.`/drill/testdata/tpch100_dir_partitioned_50000files/lineitem` where dir0=2006 and dir1=12 and dir2 IN (15, 20, 1, 2, 5);
