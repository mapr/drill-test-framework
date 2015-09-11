select
    p.int_col, p.bigint_col, p.date_col, p.time_col, p.timestamp_col, p.interval_col, p.varchar_col, cast(p.float_col as float), p.double_col, p.bool_col
from dfs.`cross-sources`.`fewtypes_null.json` p
union all  
select o.int_col, o.bigint_col, o.date_col, cast(o.time_col as time), o.timestamp_col, o.interval_col, o.varchar_col, o.float_col, o.double_col, o.bool_col
from hive.crosssources.fewtypes_null_hive o;

