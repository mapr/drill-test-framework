create or replace view s3minio.tmp.`gitignore/drill_view` as select * from cp.`employee.json` limit 7;
select * from s3minio.tmp.`/gitignore/drill_view`;
drop view s3minio.tmp.`gitignore/drill_view`;
