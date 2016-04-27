select
    o.int_col, o.bigint_col, o.date_col, o.time_col, o.timestamp_col, o.interval_col, o.varchar_col, o.float_col, o.double_col, o.bool_col,
    p.int_col, p.bigint_col, p.date_col, p.time_col, p.timestamp_col, p.interval_col, p.varchar_col, p.float_col, p.double_col, p.bool_col
from hive.fewtypes_null_hive_rc p
inner join hive.fewtypes_null_hive_orc o
    on p.int_col=o.int_col
    and p.bigint_col = o.bigint_col
    and cast(p.date_col as date) = o.date_col
    and cast(p.time_col as time) = cast(o.time_col as time)
    and cast(p.timestamp_col as timestamp) = o.timestamp_col
    and p.interval_col = o.interval_col
    and p.varchar_col = o.varchar_col
    and cast(p.float_col as float) = o.float_col
    and p.double_col = o.double_col
    and p.bool_col = o.bool_col;
