select dir0,dir1,dir2 from `min_max_dir_metadatacache` where dir0=MAXDIR('dfs_test.drillTestDir','min_max_dir_metadatacache') order by dir0,dir1,dir2 limit 1;
