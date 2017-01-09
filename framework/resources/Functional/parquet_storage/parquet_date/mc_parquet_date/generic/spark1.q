refresh table metadata dfs.`/drill/testdata/mc_parquet_date/spark_generated/d1`;
select a,b,c from dfs.`/drill/testdata/mc_parquet_date/spark_generated/d1`;
select 1 from sys.version
