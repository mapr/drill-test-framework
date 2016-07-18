select distinct((filepath || '/' || filename)) from `min_max_dir` where dir0=MAXDIR('dfs.drillTestDir','min_max_dir');
