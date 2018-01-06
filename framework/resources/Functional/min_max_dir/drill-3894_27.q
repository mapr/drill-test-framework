SELECT distinct(registration), count(*) as `count` FROM dfs_test.drillMinMaxDir.`.` WHERE dir0 = MAXDIR('dfs_test.drillMinMaxDir') group by registration;
