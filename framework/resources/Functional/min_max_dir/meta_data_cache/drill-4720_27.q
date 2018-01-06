SELECT distinct(registration), count(*) as `count` FROM dfs_test.drillMinMaxDirCache.`.` WHERE dir0 = MAXDIR('dfs_test.drillMinMaxDirCache') group by registration;
