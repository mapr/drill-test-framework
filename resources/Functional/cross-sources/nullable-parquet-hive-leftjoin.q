select
    o.int_col, o.bigint_col, o.date_col, o.time_col, o.timestamp_col, o.interval_col, o.varchar_col, o.float_col, o.double_col, o.bool_col,
    p.int_col, p.bigint_col, p.date_col, p.time_col, p.timestamp_col, p.interval_col, p.varchar_col, p.float_col, p.double_col, p.bool_col
from dfs.`cross-sources`.`fewtypes_null.parquet` p
left join hive.crosssources.fewtypes_null_hive o
    on p.int_col=o.int_col
    and p.bigint_col = o.bigint_col
    and p.date_col = o.date_col
    and p.time_col = cast(o.time_col as time)
    and p.timestamp_col = o.timestamp_col
    and p.interval_col = o.interval_col
    and p.varchar_col = o.varchar_col
    and p.float_col = o.float_col
    and p.double_col = o.double_col
    and p.bool_col = o.bool_col;
