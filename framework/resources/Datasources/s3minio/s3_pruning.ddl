drop table if exists s3minio.tmp.`/ppruning`;
create table s3minio.tmp.`/ppruning` partition by (cAge) as select cast(columns[0] as int) id, columns[1] cName, cast(columns[2] as int) cAge, to_timestamp(columns[3] , 'yyyy-MM-dd HH:mm:ss.S') cDate from s3minio.tmp.`data_for_pruning.tsv`;
