drop table if exists s3minio.tmp.`ctas/parquet_data`;
create table s3minio.tmp.`ctas/parquet_data` as select * from cp.`employee.json` limit 7;
--@test
select * from s3minio.tmp.`ctas/parquet_data`;
drop table if exists s3minio.tmp.`ctas/parquet_data`;
