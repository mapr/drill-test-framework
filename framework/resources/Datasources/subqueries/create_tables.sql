alter session set `store.parquet.reader.int96_as_timestamp`=true;
create table hive1_parquet_part partition by (create_timestamp1) as select * from hive1_parquet limit 10;
alter session set `store.parquet.reader.int96_as_timestamp`=false;
refresh table metadata `hive1_parquet_part`;
