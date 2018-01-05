SELECT distinct(dir2), count(*) FROM `min_max_dir` WHERE dir0 = MAXDIR('dfs_test.drillTestDir','min_max_dir') group by dir2;
