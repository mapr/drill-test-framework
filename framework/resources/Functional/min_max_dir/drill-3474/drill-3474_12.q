select substr(filename,1,7), `replace`(suffix, 'p', 'P') from `dfs_test.drillTestDir`.`min_max_dir/2016/Oct` where length(fqn) > 59;
