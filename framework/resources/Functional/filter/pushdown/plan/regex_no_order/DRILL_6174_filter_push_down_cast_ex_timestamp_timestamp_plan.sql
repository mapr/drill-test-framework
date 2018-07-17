explain plan for
select cast(c4 as varchar), cast(c5 as varchar), cast(c6 as varchar)
from dfs.drillTestDir.`parquet_storage/DRILL_6174/DRILL_6174_test_data`
where c5 < cast(timestamp '2017-01-03 01:34:23' as timestamp);