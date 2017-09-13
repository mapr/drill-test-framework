alter session set `planner.enable_hashjoin` = false;
create or replace view dfs_test.`cross-sources`.fewtypes_null_view1 as
select
    cast(case when columns[0] = 'null' then NULL else columns[0] end as int) int_col,
    cast(case when columns[1] = 'null' then NULL else columns[1] end as bigint) bigint_col,
    cast(case when columns[2] = 'null' then NULL else columns[2] end as date) date_col,
    cast(case when columns[3] = 'null' then NULL else columns[3] end as time) time_col,
    cast(case when columns[4] = 'null' then NULL else columns[4] end as timestamp) timestamp_col,
    case when columns[5] = 'null' then NULL else columns[5] end interval_col,
    case when columns[6] = 'null' then NULL else columns[6] end varchar_col,
    cast(case when columns[7] = 'null' then NULL else columns[7] end as float) float_col,
    cast(case when columns[8] = 'null' then NULL else columns[8] end as double) double_col,
    cast(case when columns[9] = 'null' then NULL else columns[9] end as boolean) bool_col
from dfs_test.`cross-sources`.`fewtypes_null.tbl`;

select
    o.int_col, o.bigint_col, o.date_col, o.time_col, o.timestamp_col, o.interval_col, o.varchar_col, o.float_col, o.double_col, o.bool_col,
    p.int_col, p.bigint_col, p.date_col, p.time_col, p.timestamp_col, p.interval_col, p.varchar_col, p.float_col, p.double_col, p.bool_col
from dfs_test.`cross-sources`.`fewtypes_null.parquet` p
inner join dfs_test.`cross-sources`.fewtypes_null_view1 o
    on p.int_col=o.int_col
    and p.bigint_col = o.bigint_col
    and p.date_col = cast(o.date_col as date)
    and p.time_col = cast(o.time_col as time)
    and p.timestamp_col = cast(o.timestamp_col as timestamp)
    and p.interval_col = o.interval_col
    and p.varchar_col = o.varchar_col
    and p.float_col = cast(o.float_col as float)
    and p.double_col = o.double_col
    and p.bool_col = o.bool_col;

drop view dfs_test.`cross-sources`.fewtypes_null_view1;
alter session set `planner.enable_hashjoin` = true;
