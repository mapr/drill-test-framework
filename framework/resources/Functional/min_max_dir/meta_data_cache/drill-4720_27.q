SELECT distinct(registration), count(*) as `count` FROM dfs.drillMinMaxDirCache.`.` WHERE dir0 = MAXDIR('dfs.drillMinMaxDirCache') group by registration;
