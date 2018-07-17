explain plan for
select * from dfs.drillTestDir.`parquet_storage/DRILL_6259/DRILL_6259_test_data` t
where t.list_of_complex_fields[2].nested_list_of_complex_fields[1].nested_array[0] between 1330 and 1340;