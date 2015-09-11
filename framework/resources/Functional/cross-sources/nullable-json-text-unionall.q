select
    cast(p.int_col as int), cast(p.bigint_col as bigint), cast(p.date_col as date), cast(p.time_col as time), cast(p.timestamp_col as timestamp), p.interval_col, p.varchar_col, cast(p.float_col as float), cast(p.double_col as double), cast(p.bool_col as boolean)
from dfs.`cross-sources`.`fewtypes_null.json` p
union all  
select cast(o.int_col as int), cast(o.bigint_col as bigint), cast(o.date_col as date), cast(o.time_col as time), cast(o.timestamp_col as timestamp), o.interval_col, o.varchar_col, cast(o.float_col as float), cast(o.double_col as double), cast(o.bool_col as boolean)
from dfs.`cross-sources`.`fewtypes_null.json` o;

