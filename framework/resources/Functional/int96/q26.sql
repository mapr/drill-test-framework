alter session set `store.parquet.reader.int96_as_timestamp`=true;
create or replace view hive1_parquet_v3 as select voter_id, name, age, registration, contributions, voterzone, create_timestamp1,create_timestamp2,create_date from hive1_parquet;
select voter_id, date_part('month',create_timestamp1), date_part('month',create_timestamp2) from hive1_parquet_v3 order by voter_id limit 5;
drop view hive1_parquet_v3;
alter session set `store.parquet.reader.int96_as_timestamp`=false;
