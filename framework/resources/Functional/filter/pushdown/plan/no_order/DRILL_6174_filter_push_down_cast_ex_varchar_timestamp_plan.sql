explain plan for
select cast(c4 as varchar), cast(c5 as varchar), cast(c6 as varchar)
from dfs.drillTestDir.`parquet_storage/DRILL_6174/DRILL_6174_test_data`
where c4 = cast('2017-01-08 04:11:43' as timestamp);