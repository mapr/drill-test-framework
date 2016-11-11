refresh table metadata dfs.`/drill/testdata/mc_parquet_date/spark_generated/d4`;
select distinct c from dfs.`/drill/testdata/mc_parquet_date/spark_generated/d4` order by c nulls first limit 10;
select 1 from sys.version
