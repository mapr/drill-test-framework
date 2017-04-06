select * from dfs.`/drill/testdata/tpch100_dir_partitioned_50000files/lineitem` where dir0=2006 and dir1=12 and dir2=15 and l_discount=0.07 order by l_orderkey, l_extendedprice limit 10;
