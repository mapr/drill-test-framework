select dir0,dir1,dir2 from `min_max_dir` where dir0=MAXDIR('dfs.drillTestDir','min_max_dir') order by dir0,dir1,dir2 limit 1;
