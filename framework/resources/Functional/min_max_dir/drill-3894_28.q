select dir1,count(*) from `min_max_dir` where dir0=MAXDIR('dfs.drillTestDir','min_max_dir') group by dir1;
