SELECT distinct(dir2), count(*) FROM `min_max_dir` WHERE dir0 = MAXDIR('dfs.drillTestDir','min_max_dir') group by dir2;
