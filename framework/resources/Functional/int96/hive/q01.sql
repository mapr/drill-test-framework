select num, word, CONVERT_FROM(dtg,'TIMESTAMP_IMPALA') from dfs.`drill/testdata/subqueries/hive_t1` order by num;
