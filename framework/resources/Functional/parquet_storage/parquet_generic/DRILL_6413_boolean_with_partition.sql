select * from dfs.drillTestDir.`DRILL_6413/DRILL_6413_test_data`
where bool_col = true and part_col in ('Partition_one');