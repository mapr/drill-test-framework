alter session set `store.parquet.reader.int96_as_timestamp`=true;
select count(*) from hive1_parquet where EXTRACT(year from create_timestamp2) <> '2018';
alter session set `store.parquet.reader.int96_as_timestamp`=false;
