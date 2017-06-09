alter session set `store.parquet.reader.int96_as_timestamp`=true;
select create_timestamp2 - create_timestamp1 from hive1_parquet where voter_id=3;
alter session set `store.parquet.reader.int96_as_timestamp`=false;
