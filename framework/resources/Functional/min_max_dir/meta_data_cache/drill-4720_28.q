select dir1,count(*) from `min_max_dir_metadatacache` where dir0=MAXDIR('dfs_test.drillTestDir','min_max_dir_metadatacache') group by dir1;
