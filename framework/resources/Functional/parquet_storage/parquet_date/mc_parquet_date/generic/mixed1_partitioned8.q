select date_col from (
   select date_col from dfs.`/drill/testdata/parquet_date/metadata_cache/mixed/fewtypes_null_large` where dir0=1.2 and int_col is null group by date_col
   union
   select date_col from dfs.`/drill/testdata/parquet_date/metadata_cache/mixed/fewtypes_null_large` where dir0=1.9 and big_int_col is null and float_col is null group by date_col
   union
 select date_col from dfs.`/drill/testdata/parquet_date/metadata_cache/mixed/fewtypes_null_large` where dir0=1.6 and big_int_col is null and float_col is null group by date_col
 );
