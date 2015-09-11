create table time_parquet as select cast(columns[0] as time) time_col from `../time.tbl`;
select * from time_parquet;
select 1 from sys.version;
