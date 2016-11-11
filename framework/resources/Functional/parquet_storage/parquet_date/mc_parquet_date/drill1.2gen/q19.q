select count(*) from  dfs.`/drill/testdata/parquet_date/metadata_cache/metadata_cache1.2_autogen/fewtypes_null_large` where date_col is null and varchar_col is not null;
