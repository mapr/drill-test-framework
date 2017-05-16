alter session set `store.parquet.reader.int96_as_timestamp`=true;
select count(*) from hive1_parquet where create_timestamp1 is null;
alter session set `store.parquet.reader.int96_as_timestamp`=false;
