select * from dfs.drillTestDir.`parquet_storage/DRILL_6259/DRILL_6259_test_data` t where t.complex_field.nested_field is null;