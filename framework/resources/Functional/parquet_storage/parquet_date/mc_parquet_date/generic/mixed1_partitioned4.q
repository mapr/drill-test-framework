select count(distinct date_col) from (
  select date_col from dfs_test.`/drill/testdata/parquet_date/metadata_cache/mixed/fewtypes_null_large` where dir0=1.2
  union
  select date_col from dfs_test.`/drill/testdata/parquet_date/metadata_cache/mixed/fewtypes_null_large` where dir0=1.9
);
