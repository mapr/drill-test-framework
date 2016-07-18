select sum(voter_id), avg(age), max(filename) from `dfs.drillTestDir`.`min_max_dir` where suffix <> '' and dir0=2016;
