select index, `value` from dfs.`/drill/testdata/parquet_storage/drill4764/int_8` union
select index, `value` from dfs.`/drill/testdata/parquet_storage/drill4764/int_16` union
select index, `value` from dfs.`/drill/testdata/parquet_storage/drill4764/uint_8` union
select index, `value` from dfs.`/drill/testdata/parquet_storage/drill4764/uint_16` union
select index, `value` from dfs.`/drill/testdata/parquet_storage/drill4764/uint_32`;
