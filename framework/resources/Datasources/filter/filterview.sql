alter session set `store.format` = 'parquet';
use dfs.parquet_filter_pushdown;
create or replace view orders_parts_view1 as select cast(int_id as double) my_int, cast(float_id as bigint) my_float from orders_parts where int_id > 3333;
create or replace view orders_parts_view2 as select cast(int_id as double) my_int, cast(float_id as bigint) my_float from orders_parts where int_id > 3333 and float_id <= 4333;
create or replace view orders_parts_metadata_view1 as select cast(bigint_id as double) my_bigint, cast(float_id as bigint) my_float, timestamp_id my_timestamp from orders_parts_metadata where bigint_id > 3333;
create or replace view orders_parts_metadata_view2 as select bigint_id my_bigint, float_id my_float, timestamp_id my_timestamp from orders_parts_metadata where bigint_id > 3333 and float_id <= 4333;
