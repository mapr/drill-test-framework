select cast('12345.6789' as decimal(9,4)) / cast('-0.0000000000000000000000000000000000001' as decimal(38,38)) from dfs.drillTestDir.`/numerical_decimal/data` limit 1;
