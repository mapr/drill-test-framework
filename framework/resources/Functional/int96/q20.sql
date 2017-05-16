alter session set `store.parquet.reader.int96_as_timestamp`=true;
select date_trunc('year', create_timestamp1), date_trunc('month', create_timestamp1),date_trunc('day', create_timestamp1) from hive1_parquet where voter_id=5;
alter session set `store.parquet.reader.int96_as_timestamp`=false;
