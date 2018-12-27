select cast(c4 as varchar), cast(c5 as varchar), cast(c6 as varchar)
from `filter/pushdown/DRILL_6174_test_data`
where c6 > cast('11:32:15' as time);