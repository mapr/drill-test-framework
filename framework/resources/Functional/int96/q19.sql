alter session set `store.parquet.reader.int96_as_timestamp`=true;
select c_varchar,AGE(c_timestamp) - AGE(c_timestamp) from imp_t1 where c_varchar like '%000000%';
alter session set `store.parquet.reader.int96_as_timestamp`=false;
