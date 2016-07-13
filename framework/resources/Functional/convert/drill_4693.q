select 'abc' as col1, convert_from('{"x" : "y"}', 'json') as col2, 'xyz' as col3 from cp.`tpch/region.parquet`;
