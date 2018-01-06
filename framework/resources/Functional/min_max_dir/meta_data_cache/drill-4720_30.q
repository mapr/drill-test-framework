SELECT * FROM `min_max_dir_metadatacache` WHERE dir0 = MAXDIR('dfs_test.drillTestDir','min_max_dir_metadatacache') and dir1 = IMINDIR('dfs_test.drillTestDir','min_max_dir_metadatacache/2016');
