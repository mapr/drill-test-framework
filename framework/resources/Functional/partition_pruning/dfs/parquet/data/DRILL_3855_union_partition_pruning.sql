with t as
(select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from dfs.drillTestDir.`parquet_storage/DRILL_3855/DRILL_3855_test_data`
 where int_col >= 0
 union
 select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from dfs.drillTestDir.`parquet_storage/DRILL_3855/DRILL_3855_test_data`
 where int_col < 10)
select id
from t
where part_col = 'Partition_two';