explain plan for
select * from dfs.drillTestDir.`parquet_storage/DRILL_6259/DRILL_6259_test_data` t
where t.list_of_complex_fields[2].nested_complex_field.nested_array[2] >= 1489860699000;