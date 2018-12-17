with t as
(select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from `filter/pushdown/DRILL_3855_test_data`
 where part_col = 'Partition_one' or part_col = 'Partition_two'
 union
 select id, part_col, int_col, bool_col, date_col, float_col, time_col, ts_col
 from `filter/pushdown/DRILL_3855_test_data`
 where part_col = 'Partition_two' or part_col = 'Partition_three')
select id
from t
where int_col = 0;