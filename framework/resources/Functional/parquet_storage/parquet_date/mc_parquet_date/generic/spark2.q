refresh table metadata dfs.`/drill/testdata/mc_parquet_date/spark_generated/d2`;
select a,b,c from dfs.`/drill/testdata/mc_parquet_date/spark_generated/d2`;
select 1 from sys.version
