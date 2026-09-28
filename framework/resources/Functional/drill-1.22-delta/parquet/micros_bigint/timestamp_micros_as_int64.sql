-- expected: python, UTC epoch micros of 2021-08-01 22:12:41.123456 / 2022-05-06 09:00:22.654321 / 2023-02-10 00:32:58.174711 (upstream TIMESTAMP_MICROS_VALUES)
alter session set `store.parquet.reader.timestamp_micros_as_int64` = true;
--@test
select _TIMESTAMP_MICROS_int64 ts from `drill-1.22-delta/parquet_micros/microseconds.parquet`;
alter session reset `store.parquet.reader.timestamp_micros_as_int64`
