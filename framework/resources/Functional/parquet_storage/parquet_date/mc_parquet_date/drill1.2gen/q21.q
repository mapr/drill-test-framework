select count(distinct dt) from (select date_col dt from  dfs.`/drill/testdata/parquet_date/metadata_cache/metadata_cache1.2_autogen/fewtypes_null_large`  where date_col is not null
union all 
select c dt from dfs.`/drill/testdata/parquet_date/spark_generated/d4` where c is not null) data
