SELECT dir0,dir1,dir2 FROM dfs.drillTestDir.`min_max_dir` WHERE dir0 = MINDIR('dfs.drillTestDir','min_max_dir') order by dir1;
