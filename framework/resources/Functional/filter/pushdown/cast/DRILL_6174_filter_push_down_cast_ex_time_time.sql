select cast(c4 as varchar), cast(c5 as varchar), cast(c6 as varchar)
from `filter/pushdown/DRILL_6174_test_data`
where c6 = cast(time '03:08:47' as time);