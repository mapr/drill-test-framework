with t as
(select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from dfs.drillTestDir.`parquet_storage/DRILL_3855/DRILL_3855_test_data`
 where date_col >= date '2017-12-30' or date_col < date '2017-01-01' or date_col is null
 union
 select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from dfs.drillTestDir.`parquet_storage/DRILL_3855/DRILL_3855_test_data`
 where date_col < date '2017-01-01' or date_col between date '2017-02-27' and date '2017-03-03'
 union
 select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from dfs.drillTestDir.`parquet_storage/DRILL_3855/DRILL_3855_test_data`)
select id
from t
where part_col = 'Partition_two';