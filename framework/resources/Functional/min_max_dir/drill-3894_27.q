SELECT distinct(registration), count(*) as `count` FROM dfs.drillMinMaxDir.`.` WHERE dir0 = MAXDIR('dfs.drillMinMaxDir') group by registration;
