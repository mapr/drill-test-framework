select min(dir1), min(dir2) from `min_max_dir_metadatacache` where dir0=MAXDIR('dfs.drillTestDir','min_max_dir_metadatacache');
