select min(dir1), min(dir2) from `min_max_dir` where dir0=MAXDIR('dfs_test.drillTestDir','min_max_dir');
