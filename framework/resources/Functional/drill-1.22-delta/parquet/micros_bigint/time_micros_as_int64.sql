-- expected: python, ((h*60+m)*60+s)*1e6+us for 00:32:58.174711 / 09:00:22.654321 / 22:12:41.123456 (upstream TIME_MICROS_VALUES)
alter session set `store.parquet.reader.time_micros_as_int64` = true;
--@test
select _TIME_MICROS_int64 t from `drill-1.22-delta/parquet_micros/microseconds.parquet`;
alter session reset `store.parquet.reader.time_micros_as_int64`
