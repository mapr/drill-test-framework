SELECT dir0,dir1,dir2 FROM dfs_test.drillTestDir.`min_max_dir_metadatacache` WHERE dir0 = MINDIR('dfs_test.drillTestDir','min_max_dir_metadatacache') order by dir1;
